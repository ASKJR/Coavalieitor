/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Aluno;
import Beans.Professor;
import Beans.Usuario;
import Dao.AlunoDao;
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
@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController extends HttpServlet {

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
            UsuarioDao usuarioDao = new UsuarioDao();
            Usuario user   = new Usuario();
            String insertEmail = request.getParameter("email");
            String insertSenha = request.getParameter("senha");
            String userType    = request.getParameter("userType");
            if(insertEmail !=null && insertSenha !=null && userType!=null){
                user.setEmail(insertEmail);
                user.setSenha(insertSenha);

                //Antes de inserir um usuário no banco. checar se o e-mail já existe no BD.
                if(!usuarioDao.emailExists(insertEmail)){
                    int id = usuarioDao.insert(user);
                    //Se o usuário for professor inserir referência na tabela de professor
                    if(userType.equals("professor")){
                        ProfessorDao profDao  = new ProfessorDao();
                        Professor prof = new Professor();
                        prof.setId(id);
                        profDao.insert(prof);
                        RequestDispatcher rd=request.getRequestDispatcher("View/Professor/indexProfessor.jsp");  
                        rd.forward(request, response);
                    }
                    //Caso contrário o usuário é estudante
                    else{
                        AlunoDao alunoDao = new AlunoDao();
                        Aluno aluno = new Aluno();
                        aluno.setId(id);
                        alunoDao.insert(aluno);
                        RequestDispatcher rd=request.getRequestDispatcher("View/Aluno/indexAluno.jsp");  
                        rd.forward(request, response);
                    }  
                }
                else{
                    HttpSession session = request.getSession();
                    session.setAttribute("mensagemErro", "E-mail já cadastrado no sistema.");
                    RequestDispatcher rd=request.getRequestDispatcher("cadastrarUsuario.jsp");  
                    rd.forward(request, response);
                }
            }
            //por enquanto o usuário é redirecionado para o cadastro de professor
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

}
