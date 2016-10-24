/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControllerAluno;

import Beans.Usuario;
import Dao.MatriculaDao;
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
@WebServlet(name = "NotaControllerAluno", urlPatterns = {"/NotaControllerAluno"})
public class NotaControllerAluno extends HttpServlet {
    
    private static String BUSCAR    = "View/Aluno/buscarNotas.jsp";
    
    private MatriculaDao   daoMatricula;
    
    public NotaControllerAluno(){
        daoMatricula = new MatriculaDao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Pegando as informações do aluno na sessão
        HttpSession session = request.getSession();
        Usuario aluno = (Usuario) session.getAttribute("usuarioLogado");
        int idAluno = aluno.getId();
        
        String forward = "";
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("buscarNotas")){
            request.setAttribute("matriculas",daoMatricula.getMatriculaByAluno(idAluno));
            forward = BUSCAR;
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
