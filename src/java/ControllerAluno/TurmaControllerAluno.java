/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControllerAluno;

import Beans.Matricula;
import Beans.Turma;
import Beans.Usuario;
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
@WebServlet(name = "TurmaControllerAluno", urlPatterns = {"/TurmaControllerAluno"})
public class TurmaControllerAluno extends HttpServlet {
    
    private static String LIST    = "View/Aluno/listarTurmas.jsp";
    
    private TurmaDao       daoTurma;
    private Turma          turma;
    private MatriculaDao   daoMatricula;
    private Matricula      matricula;
    public TurmaControllerAluno(){ 
        daoTurma       = new TurmaDao();
        daoMatricula   = new MatriculaDao();
        turma          = new Turma();
        matricula      = new Matricula();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        //Pega os dados do aluno na sessão
        Usuario aluno;
        aluno = (Usuario) session.getAttribute("usuarioLogado");
        int idAluno = aluno.getId();
        String forward = "";
        String action = request.getParameter("action");
        if(action.equalsIgnoreCase("listarTurmas")){
            request.setAttribute("matriculasAluno",daoMatricula.getMatriculaByAluno(idAluno));
            request.setAttribute("turmas", daoTurma.getAllTurmasInfo());
            forward = LIST;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Matricular aluno em turma
        
        HttpSession session = request.getSession();
        //Pega os dados do aluno na sessão
        Usuario aluno;
        aluno = (Usuario) session.getAttribute("usuarioLogado");
        String idTurma = request.getParameter("idTurma");
        String palavraChave = request.getParameter("palavraChave");
        String forward = LIST;
        
        if(idTurma!=null && palavraChave!=null && aluno!=null){
            int idAluno    = aluno.getId();
            turma.setId(Integer.parseInt(idTurma));
            turma.setPalavra_chave(palavraChave);
            if(daoTurma.IsPalavraChaveValid(turma)){
                matricula.getAluno().setId(idAluno);
                matricula.getTurma().setId(Integer.parseInt(idTurma));
                daoMatricula.insert(matricula);
                session.setAttribute("mensagemSucesso","Matricula realizada com sucesso.");
            }
            else{
                session.setAttribute("mensagemErro","Senha incorreta.");
            }
            request.setAttribute("matriculasAluno",daoMatricula.getMatriculaByAluno(idAluno));
            request.setAttribute("turmas", daoTurma.getAllTurmasInfo());
            RequestDispatcher view = request.getRequestDispatcher(forward);
            view.forward(request, response);
        }
        else{
            try (PrintWriter out = response.getWriter()) {
                out.print("Erro: Parâmetros inválidos");
            }
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
