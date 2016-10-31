/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControllerAluno;

import Beans.Correcao;
import Beans.Usuario;
import Dao.CorrecaoDao;
import Dao.SolucaoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kato
 */
@WebServlet(name = "CorrecaoControllerAluno", urlPatterns = {"/CorrecaoControllerAluno"})
public class CorrecaoControllerAluno extends HttpServlet {
    
    private static String INSERT    = "View/Aluno/addCorrecao.jsp";
    private SolucaoDao     daoSolucao;
    private Correcao       correcao;
    private CorrecaoDao    daoCorrecao;
    
    public CorrecaoControllerAluno(){
        daoSolucao  = new SolucaoDao();
        correcao    = new Correcao();
        daoCorrecao = new CorrecaoDao();
    }
   

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action.equalsIgnoreCase("insert")) {
            int idAvaliacao = Integer.parseInt(request.getParameter("idSolucao"));
            request.setAttribute("solucao",daoSolucao.getSolucaoById(idAvaliacao));
            session.setAttribute("idAvaliacao",request.getParameter("idAvaliacao"));
            forward = INSERT;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Pegando as informações do aluno na sessão
        HttpSession session = request.getSession();
        Usuario aluno = (Usuario) session.getAttribute("usuarioLogado");
        int idAluno = aluno.getId();
        
        String comentario  = request.getParameter("comentario");
        String idAvaliacao = (String)session.getAttribute("idAvaliacao");
        Double nota        = Double.parseDouble(request.getParameter("nota"));
        int idSolucao      = Integer.parseInt(request.getParameter("idSolucao"));
        
        if(comentario!=null && idSolucao!=0){
            correcao.setComentario(comentario);
            correcao.setNota(nota);
            correcao.getSolucao().setId(idSolucao);
            correcao.getAluno().getUser().setId(idAluno);
            daoCorrecao.insert(correcao);
            session.setAttribute("mensagemSucesso","Sua correção foi efetuada com sucesso!");
            response.sendRedirect("SolucaoControllerAluno?action=listarSolucoes&idAvaliacao=" + idAvaliacao);
        }
        else{
            try (PrintWriter out = response.getWriter()) {
                out.print("Erro: Os parâmetros de correção são inválidos!!");
            }
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
