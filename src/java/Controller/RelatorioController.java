/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Turma;
import ControllerAluno.*;
import Beans.Usuario;
import Dao.CursoDao;
import Dao.DisciplinaDao;
import Dao.InstituicaoDao;
import Dao.MatriculaDao;
import Dao.RelatorioDao;
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
@WebServlet(name = "RelatorioController", urlPatterns = {"/RelatorioController"})
public class RelatorioController extends HttpServlet {
    
    private InstituicaoDao daoInstituicao;
    private CursoDao       daoCurso;
    private DisciplinaDao  daoDisciplina;
    private TurmaDao       daoTurma;
    private Turma          turma;    
    
    public RelatorioController(){
        super();
        daoRelatorio = new RelatorioDao();
        daoInstituicao = new InstituicaoDao();
        daoCurso       = new CursoDao();
        daoDisciplina  = new DisciplinaDao();
        daoTurma       = new TurmaDao();
        turma          = new Turma();
    }    
    
    private static String BUSCAR    = "View/Professor/relatorios.jsp";
    
    private RelatorioDao daoRelatorio;
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Pegando as informações do aluno na sessão
        HttpSession session = request.getSession();
        Usuario aluno = (Usuario) session.getAttribute("usuarioLogado");
//        int idAluno = aluno.getId();
        
        Usuario professor;
        professor = (Usuario) session.getAttribute("usuarioLogado");
        int idProfessor = professor.getId();        
        
        String forward = "";
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("buscarNotas")){
            //request.setAttribute("matriculas",daoRelatorio.getMatriculaByAluno(idAluno));
            forward = BUSCAR;
        }
        if(action.equalsIgnoreCase("carregarRelatorios")){
            //request.setAttribute("matriculas",daoRelatorio.getMatriculaByAluno(idAluno));
            //Parametros para view
            //int idInstituicao   = Integer.parseInt(request.getParameter("idInstituicao"));
            //int idCurso         = Integer.parseInt(request.getParameter("idCurso"));
            //int idDisciplina    = Integer.parseInt(request.getParameter("idDisciplina"));
            //int idTurma         = Integer.parseInt(request.getParameter("idTurma"));
            //request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(idInstituicao));
            //request.setAttribute("curso",daoCurso.getCursoById(idCurso));
            //request.setAttribute("disciplina",daoDisciplina.getDisciplinaById(idDisciplina));  
            //request.setAttribute("turma", daoTurma.getTurmaById(idTurma));
            //forward = BUSCAR;
        } else if (action.equalsIgnoreCase("listarTurmasPorProfessor")) {
            
            int idInstituicao = Integer.parseInt(request.getParameter("selectInstituicao"));
            int idCurso       = Integer.parseInt(request.getParameter("selectCurso"));
            int idDisciplina  = Integer.parseInt(request.getParameter("selectDisciplina"));
            
            //Parametros para view
            request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(idInstituicao));
            request.setAttribute("curso",daoCurso.getCursoById(idCurso));
            request.setAttribute("disciplina",daoDisciplina.getDisciplinaById(idDisciplina));  
            request.setAttribute("turmas",daoTurma.getAllTurmasByProfessor(idDisciplina, idProfessor));
            forward = BUSCAR;
            
        } else if (action.equalsIgnoreCase("pesquisarTurmas")) {
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = BUSCAR;
        } else {
            //Adicionar turma
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = BUSCAR;
        }
        request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());            
            forward = BUSCAR;
        
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
