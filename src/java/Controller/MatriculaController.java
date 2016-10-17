/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Matricula;
import Beans.Turma;
import Dao.MatriculaDao;
import Dao.TurmaDao;
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
@WebServlet(name = "MatriculaController", urlPatterns = {"/MatriculaController"})
public class MatriculaController extends HttpServlet {
    private static String LIST    = "View/Professor/listarAlunosTurma.jsp";
    
    private TurmaDao       daoTurma;
    private MatriculaDao   daoMatricula;
    private Turma          turma;
    private Matricula      matricula;
    
    
    
    public MatriculaController(){
        daoTurma       = new TurmaDao();
        daoMatricula   = new MatriculaDao();
        turma          = new Turma();
        matricula      = new Matricula();
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward;
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        
        if (action.equalsIgnoreCase("delete")) {
            int idTurma = Integer.parseInt(request.getParameter("idTurma"));
            int idAluno = Integer.parseInt(request.getParameter("idAluno"));
            daoMatricula.delete(idAluno, idTurma);
            turma = daoTurma.getTurmaById(idTurma);
            session.setAttribute("mensagemSucesso", "Aluno removido com sucesso!");
            request.setAttribute("matriculas", daoMatricula.getAllMatriculasByTurma(idTurma));
            request.setAttribute("turma",turma);
            forward = LIST;
        } else if(action.equalsIgnoreCase("listarAlunosTurma")){
            int idTurma = Integer.parseInt(request.getParameter("idTurma"));
            turma = daoTurma.getTurmaById(idTurma);
            request.setAttribute("matriculas", daoMatricula.getAllMatriculasByTurma(idTurma));
            request.setAttribute("turma",turma);
            forward = LIST;
        } else {
            forward = LIST;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //System.out.println("INSERINDO ALUNO REBELDE");
        String aluno = request.getParameter("idAluno");
        String turma = request.getParameter("idTurma");
        HttpSession session = request.getSession();
        RequestDispatcher view;
        
        if(aluno!=null && turma!=null){
            int idAluno   = Integer.parseInt(aluno);
            int idTurma   = Integer.parseInt(turma);
            if(!daoMatricula.matriculaExist(idAluno, idTurma)){
                //Inserir
                matricula.getAluno().setId(idAluno);
                matricula.getTurma().setId(idTurma);
                daoMatricula.insert(matricula);
                session.setAttribute("mensagemSucesso", "Aluno matriculado com sucesso!");
            }
            else{
                session.setAttribute("mensagemErro", "O aluno selecionado já está matriculado nessa turma.");
                
            }
            request.setAttribute("matriculas", daoMatricula.getAllMatriculasByTurma(idTurma));
            request.setAttribute("turma",daoTurma.getTurmaById(idTurma));
            view = request.getRequestDispatcher(LIST);
            view.forward(request, response);
            
        }
        else{
            try (PrintWriter out = response.getWriter()) {
                out.print("Matrícula inválida!");
            }
        }
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
