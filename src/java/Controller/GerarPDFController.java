/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Usuario;
import Dao.ConnectionFactory;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Connection;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Kato
 */
@WebServlet(name = "GerarPDFController", urlPatterns = {"/GerarPDFController"})
public class GerarPDFController extends HttpServlet {
    
    
    
    //Caso o PDF retorne NULL, redirecionar de volta para view que chamou esse Servelt com mensagem de erro
    private static final String REDIRECT_BACK_NOTAS = "NotaControllerAluno?action=buscarNotas";
    private static final String REDIRECT_BACK_RELATORIOS = "RelatorioController?action=carregarRelatorios\"";

    private HashMap    params;
    private Connection con;
    private String     jasper;
    private String     redirect;
    private String     erroMessage;
    
    
    
    public GerarPDFController(){
        params      = new HashMap();
        jasper      = "";
        redirect    = "";
        erroMessage = "";
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        con         = new ConnectionFactory().getConnection();
        HttpSession session = request.getSession();
        String pdf = request.getParameter("getPDF");
        
        try {      
            //Relatório PDF de notas do aluno por turma
            if (pdf.equalsIgnoreCase("notaByAlunoTurma")) {
                jasper = request.getContextPath() + "/PDF/notaByAlunoTurma.jasper";
                String idTurma = request.getParameter("selectTurma");
                Usuario aluno = (Usuario) session.getAttribute("usuarioLogado");
                params.put("turma_id",Integer.parseInt(idTurma));
                params.put("aluno_id",aluno.getId());
                redirect = REDIRECT_BACK_NOTAS;
                erroMessage = "Sua nota não foi lançada até o momento, tente mais tarde :(";
            }
            else if(pdf.equalsIgnoreCase("relatorioProfessor")) { 
                String tipoRelatorio = request.getParameter("selectTipoRelatorio");
                if(tipoRelatorio == "alunosByTurma") {
                    jasper = request.getContextPath() + "/PDF/alunosByTurma.jasper";
                    String idDisciplina = request.getParameter("selectDisciplina");
                    Usuario professor = (Usuario) session.getAttribute("usuarioLogado");
                    params.put("disc_id",Integer.parseInt(idDisciplina));
                    params.put("prof_id",professor.getId());
                    redirect = REDIRECT_BACK_RELATORIOS;
                    erroMessage = "Sem dados disponíveis :(";
                }
                else if(tipoRelatorio == "correcoesByAluno") {
                    jasper = request.getContextPath() + "/PDF/correcoesByAluno.jasper";                    
                    Usuario professor = (Usuario) session.getAttribute("usuarioLogado");
                    //verificar se haverá parametros mais tarde
                    //String idDisciplina = request.getParameter("selectDisciplina");                    
                    //params.put("disc_id",Integer.parseInt(idDisciplina));
                    //params.put("prof_id",professor.getId());
                    redirect = REDIRECT_BACK_RELATORIOS;
                    erroMessage = "Sem dados disponíveis :(";
                }
            }

            // Host onde o servlet esta executando
            String host = "http://" + request.getServerName() + ":" + request.getServerPort();
            
            // URL para acesso ao relatório
            URL jasperURL = new URL(host + jasper);
                System.out.println(params);
                System.out.println(con);
            byte[] bytes =JasperRunManager.runReportToPdf(jasperURL.openStream(), params, con);
            
            if (bytes != null) {
                // A página será mostrada em PDF
                response.setContentType("application/pdf");
                // Envia o PDF para o Cliente
                OutputStream ops = null;
                ops = response.getOutputStream();
                ops.write(bytes);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            session.setAttribute("mensagemErro",erroMessage);
            response.sendRedirect(redirect);
        }
        finally {
            if (con!=null)
            try { con.close(); } catch(Exception e) {}
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
