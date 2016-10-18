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
        String idInstituicao = request.getParameter("idInstituicao");
        String idCurso       = request.getParameter("idCurso");
        String idDisciplina  = request.getParameter("idDisciplina");
        int idTurma = Integer.parseInt(request.getParameter("idTurma"));
        
        //Settando valores na sessão para configurar o botão de voltar
        if(idInstituicao!=null && idCurso!=null && idDisciplina!=null){
            session.setAttribute("idInstituicao",idInstituicao);
            session.setAttribute("idCurso",idCurso);
            session.setAttribute("idDisciplina",idDisciplina);
        }
        
        if (action.equalsIgnoreCase("delete")) {
            int idAluno = Integer.parseInt(request.getParameter("idAluno"));
            daoMatricula.delete(idAluno, idTurma);
            turma = daoTurma.getTurmaById(idTurma);
            session.setAttribute("mensagemSucesso", "Aluno removido com sucesso!");
            forward = LIST;
        } else if(action.equalsIgnoreCase("listarAlunosTurma")){
            turma = daoTurma.getTurmaById(idTurma);
            forward = LIST;
        } else {
            forward = LIST;
        }
        request.setAttribute("matriculas", daoMatricula.getAllMatriculasByTurma(idTurma));
        request.setAttribute("turma",turma);
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String aluno = request.getParameter("idAluno");
        String turma = request.getParameter("idTurma");
        HttpSession session = request.getSession();
        RequestDispatcher view;
        
        if(aluno!=null && turma!=null){
            int idAluno   = Integer.parseInt(aluno);
            int idTurma   = Integer.parseInt(turma);
            //Veririfica se o aluno já está matriculado na turma
            if(!daoMatricula.matriculaExist(idAluno, idTurma)){
                //Matriculando um aluno em uma turma manualmente, módulo professor
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
