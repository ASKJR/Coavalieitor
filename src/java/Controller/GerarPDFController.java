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
    
    private HashMap    params;
    private Connection con;
    private String     jasper;
    private String     redirect;
    private String     erroMessage;
    
    
    
    public GerarPDFController(){
        params      = new HashMap();
        con         = new ConnectionFactory().getConnection();
        jasper      = "";
        redirect    = "";
        erroMessage = "";
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
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

            // Host onde o servlet esta executando
            String host = "http://" + request.getServerName() + ":" + request.getServerPort();
            
            // URL para acesso ao relatório
            URL jasperURL = new URL(host + jasper);
            
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
