/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Usuario;
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
            UsuarioDao dao = new UsuarioDao();
            Usuario user   = new Usuario();
            
            //CHECK INSERT
            if(request.getParameter("insert")!=null){
                String insertEmail = request.getParameter("email");
                String insertSenha = request.getParameter("senha");
                user.setEmail(insertEmail);
                user.setSenha(insertSenha);
                //Antes de inserir um usuário no banco. checar se o e-mail já existe no BD.
                if(!dao.emailExists(insertEmail)){
                    dao.insert(user);
                    //Inserir referencia na tabela de professor || ou  Aluno. dependendo do radio
                    RequestDispatcher rd=request.getRequestDispatcher("View/Professor/cadastrarProfessor.jsp");  
                    rd.forward(request, response);  
                }
                else{
                    System.out.println("EMAIL EXISTENTE NO SISTEMA!!!");
                    HttpSession session = request.getSession();
                    session.setAttribute("mensagemErro", "E-mail já cadastrado no sistema.");

                    RequestDispatcher rd=request.getRequestDispatcher("cadastrarUsuario.jsp");  
                    rd.forward(request, response);
                }
            }
            //CHECK DELETE
            if(request.getParameter("delete")!=null){
                user.setId(Integer.parseInt(request.getParameter("delete")));
                dao.delete(user);
            }
            //CHECK UPDATE
            if(request.getParameter("update")!=null){
                String updateEmail = request.getParameter("nome");
                String updateSenha = request.getParameter("senha");
                String updateId   = request.getParameter("update");
                user.setId(Integer.parseInt(updateId));
                user.setEmail(updateEmail);
                user.setSenha(updateSenha);
                dao.update(user);
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
