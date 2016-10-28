/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControllerAluno;

import Beans.Solucao;
import Beans.Usuario;
import Dao.AvaliacaoDao;
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
@WebServlet(name = "SolucaoControllerAluno", urlPatterns = {"/SolucaoControllerAluno"})
public class SolucaoControllerAluno extends HttpServlet {
    private static String INSERT    = "View/Aluno/addSolucao.jsp";
    private static String LIST      = "View/Aluno/listarAvaliacoesTurma.jsp";
    
    private AvaliacaoDao   daoAvaliacao;
    private SolucaoDao     daoSolucao;
    private Solucao        solucao;
    public SolucaoControllerAluno(){
        daoAvaliacao = new AvaliacaoDao();
        daoSolucao   = new SolucaoDao();
        solucao      = new Solucao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("insert")) {
            int idAvaliacao = Integer.parseInt(request.getParameter("idAvaliacao"));
            request.setAttribute("avaliacao",daoAvaliacao.getAvaliacaoById(idAvaliacao));
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
        
        String resposta    = request.getParameter("resposta");
        String idAvaliacao = request.getParameter("idAvaliacao");
        
        if(idAvaliacao!=null && resposta!=null){
            solucao.getAluno().getUser().setId(idAluno);
            solucao.getAvaliacao().setId(Integer.parseInt(idAvaliacao));
            solucao.setResposta(resposta);
            daoSolucao.insert(solucao);
            session.setAttribute("mensagemSucesso","Sua solução foi submetida com sucesso!");
            response.sendRedirect("AvaliacaoControllerAluno?action=listarAvaliacoesPorTurma&selectTurma=" +session.getAttribute("idTurma") );
        }
        else{
            try (PrintWriter out = response.getWriter()) {
                out.print("Erro: resposta inválida!!");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
