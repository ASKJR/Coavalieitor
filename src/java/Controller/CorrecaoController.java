/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dao.AvaliacaoDao;
import Dao.CorrecaoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kato
 */
@WebServlet(name = "CorrecaoController", urlPatterns = {"/CorrecaoController"})
public class CorrecaoController extends HttpServlet {
    
    private static String LIST = "View/Professor/listarCorrecoesAvaliacao.jsp";
    
    private CorrecaoDao  daoCorrecao;
    private AvaliacaoDao daoAvaliacao;
    
    public CorrecaoController(){     
        daoCorrecao  = new CorrecaoDao();
        daoAvaliacao = new AvaliacaoDao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward      = "";
        String action       = request.getParameter("action");
        
        if (action.equalsIgnoreCase("listarCorrecoesPorAvaliacao")) {
           int idTurma     = Integer.parseInt(request.getParameter("idTurma"));
           int idAvaliacao = Integer.parseInt(request.getParameter("idAvaliacao"));
           request.setAttribute("correcoes",daoCorrecao.getCorrecoesByAvaliacao(idAvaliacao));
           request.setAttribute("avaliacao",daoAvaliacao.getAvaliacaoById(idAvaliacao));
           forward = LIST; 
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);   
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
