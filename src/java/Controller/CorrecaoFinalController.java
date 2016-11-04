/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.CorrecaoFinal;
import Dao.AvaliacaoDao;
import Dao.CorrecaoDao;
import Dao.CorrecaoFinalDao;
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
@WebServlet(name = "CorrecaoFinalController", urlPatterns = {"/CorrecaoFinalController"})
public class CorrecaoFinalController extends HttpServlet {
    
    private static String LIST = "View/Professor/avaliarAlunos.jsp";
    
    
    private CorrecaoFinalDao  daoCorrecaoFinal;
    private CorrecaoDao       daoCorrecao;
    private AvaliacaoDao      daoAvaliacao;
    private CorrecaoFinal     correcaoFinal;
    
    public CorrecaoFinalController(){
        daoCorrecaoFinal = new CorrecaoFinalDao();
        daoCorrecao      = new CorrecaoDao();
        daoAvaliacao     = new AvaliacaoDao();
        correcaoFinal    = new CorrecaoFinal();
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward      = "";
        String action       = request.getParameter("action");
        HttpSession session = request.getSession();
        
        if (action.equalsIgnoreCase("avaliarAlunos")) {
            int idTurma     = Integer.parseInt(request.getParameter("idTurma"));
            int idAvaliacao = Integer.parseInt(request.getParameter("idAvaliacao"));
            session.setAttribute("idTurma",request.getParameter("idTurma"));
            session.setAttribute("idAvaliacao",request.getParameter("idAvaliacao"));
            
            request.setAttribute("correcoesfinais",daoCorrecaoFinal.getCorrecoesFinalByAvaliacao(idTurma,idAvaliacao));
            request.setAttribute("avaliacao",daoAvaliacao.getAvaliacaoById(idAvaliacao));
            request.setAttribute("medias",daoCorrecao.getMediaByAluno(idAvaliacao));
            forward = LIST;
        }
        
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idCorrecaoFinal = request.getParameter("idCorrecaoFinal");
        String feedback        = request.getParameter("feedback");
        String notaProf        = request.getParameter("notaProf");
        HttpSession session = request.getSession();
        
        String idTurma = (String) session.getAttribute("idTurma");
        String idAvaliacao = (String) session.getAttribute("idAvaliacao");
        
        
        correcaoFinal.setFeedback(feedback);
        correcaoFinal.setNota_final(Double.parseDouble(notaProf));
        if (!idCorrecaoFinal.equals("0") ) {
           //update
           //correcaoFinal.set
           correcaoFinal.setId(Integer.parseInt(idCorrecaoFinal));
           daoCorrecaoFinal.update(correcaoFinal);
        }
        else{
            //Inserir nova correcao_final
            String idAluno = request.getParameter("idAluno");
            correcaoFinal.getAluno().getUser().setId(Integer.parseInt(idAluno));
            correcaoFinal.getAvaliacao().setId(Integer.parseInt(idAvaliacao));
            daoCorrecaoFinal.insert(correcaoFinal);
        }
        response.sendRedirect("CorrecaoFinalController?action=avaliarAlunos&idTurma=" +idTurma +"&idAvaliacao=" + idAvaliacao);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
