/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.GraficoFasesAvaliacao;
import Beans.Usuario;
import Dao.AvaliacaoDao;
import Dao.CorrecaoDao;
import Dao.DashboardDao;
import Dao.ProfessorDao;
import Dao.UsuarioDao;
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
 * @author Welyngton
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String loginEmail = request.getParameter("email");
            String loginSenha = request.getParameter("senha");
            if(loginEmail!=null && loginSenha!=null){
                Usuario user = new Usuario();
                UsuarioDao usuarioDao = new UsuarioDao();
                ProfessorDao professorDao = new ProfessorDao();
                user.setEmail(loginEmail);
                user.setSenha(loginSenha);
                int userId = usuarioDao.login(user);
                //Login validado
                if(userId!=-1){
                    
                    //settando o usuário na sessão
                    HttpSession session = request.getSession();
                    Usuario usuarioLogado = usuarioDao.getUsuarioById(userId);
                    session.setAttribute("usuarioLogado",usuarioLogado);
                    
                    //Busca por professor pelo ID,se encotrar o usuário é professor
                    if(professorDao.getProfessorById(userId)!=null){
                        session.setAttribute("tipoUsuario","professor");
                        //Carrega Dashboard do Professor
                        //ajustar a chamada do dashboard - retirar do login o carregamento dos dados
                        //Foi mal Kato...
                        //Kato, no próximo commit eu arrumo, juro!
                        carregarDashboard(userId, request);
                        RequestDispatcher rd=request.getRequestDispatcher("View/Professor/indexProfessor.jsp");  
                        rd.forward(request, response);  
                    }
                    //Senão encontrar o usuário é aluno
                    else{
                        session.setAttribute("tipoUsuario","aluno");
                        response.sendRedirect("TurmaControllerAluno?action=listarTurmas");
                    }
                }
                //mostrar mensagem de erro
                else{
                    HttpSession session = request.getSession();
                    session.setAttribute("mensagemErro", "Login inválido");
                    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
                    rd.forward(request, response);
                }
            }
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

    private void carregarDashboard(int userId, HttpServletRequest request) {
               
        AvaliacaoDao daoAvaliacao = new AvaliacaoDao();
        CorrecaoDao daoCorrecao = new CorrecaoDao();
        DashboardDao daoDashboard = new DashboardDao();
        int qtdAvaliacoes = daoAvaliacao.numAvaliacoesAbertasByProfessor(userId);
        int qtdCorrecoes = daoCorrecao.numCorrecoesAbertasByProfessor(userId);
        request.setAttribute("avaliacoes",qtdAvaliacoes);
        request.setAttribute("correcoes",qtdCorrecoes);
        GraficoFasesAvaliacao grafFasesAval = daoDashboard.getDadosGraficoFasesAvaliacao();
        request.setAttribute("avalNaoIniciadas", grafFasesAval.getNaoIniciadas());
        request.setAttribute("avalEmSubmissao", grafFasesAval.getEmSubmissão());            
        request.setAttribute("avalEmCorrecao", grafFasesAval.getEmCorrecao());           
        request.setAttribute("avalFinalizadas", grafFasesAval.getFinalizadas());  
        request.setAttribute("listaTopCorretores", daoDashboard.obterListaCorretores());
        request.setAttribute("listaMenoresNotas", daoDashboard.obterListaMenoresNotas());
        request.setAttribute("listaAvaliacoesMes", daoDashboard.obterListaAvaliacoesMes());
        request.setAttribute("listaCorrecoesMes", daoDashboard.obterListaCorrecoesMes());
        request.setAttribute("listaMediaMes", daoDashboard.obterListaMediaMes());
//        System.out.println(daoDashboard.obterListaMenoresNotas().get(0).getNome());
    }
}
