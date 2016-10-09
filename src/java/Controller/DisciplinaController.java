/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Disciplina;
import Dao.CursoDao;
import Dao.DisciplinaDao;
import Dao.InstituicaoDao;
import java.io.IOException;
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
@WebServlet(name = "DisciplinaController", urlPatterns = {"/DisciplinaController"})
public class DisciplinaController extends HttpServlet {
    private static String INSERT  = "View/Professor/addDisciplina.jsp";
    private static String EDIT    = "View/Professor/editDisciplina.jsp";
    private static String LIST    = "View/Professor/listarDisciplinas.jsp";
    
    private InstituicaoDao daoInstituicao;
    private CursoDao       daoCurso;
    private DisciplinaDao  daoDisciplina;
    private Disciplina     disciplina;

    public DisciplinaController(){
        super();
        daoInstituicao = new InstituicaoDao();
        daoCurso       = new CursoDao();
        daoDisciplina = new DisciplinaDao();
        disciplina     = new Disciplina();
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String forward;
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")) {
            int idDisciplina = Integer.parseInt(request.getParameter("idDisciplina"));
            disciplina.setId(idDisciplina);
            daoDisciplina.delete(disciplina);
            request.setAttribute("disciplinas",daoDisciplina.getAllDisciplinasByCurso(Integer.parseInt(request.getParameter("idCurso"))));
            request.setAttribute("curso",daoCurso.getCursoById(Integer.parseInt(request.getParameter("idCurso"))));
            request.setAttribute("idInstituicao",request.getParameter("idInstituicao"));
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(Integer.parseInt(request.getParameter("idInstituicao"))));
            forward = LIST; 
        } else if (action.equalsIgnoreCase("edit")) {
            int idDisciplina  = Integer.parseInt(request.getParameter("idDisciplina"));
            request.setAttribute("instituicao",request.getParameter("idInstituicao"));
            request.setAttribute("curso",request.getParameter("idCurso"));
            request.setAttribute("disciplina", daoDisciplina.getDisciplinaById(idDisciplina));
            
            forward = EDIT;
            
        } else if (action.equalsIgnoreCase("listarDisciplinaPorCurso")) {
            request.setAttribute("disciplinas",daoDisciplina.getAllDisciplinasByCurso(Integer.parseInt(request.getParameter("selectCurso"))));
            request.setAttribute("idInstituicao",request.getParameter("selectInstituicao"));
            request.setAttribute("curso",daoCurso.getCursoById(Integer.parseInt(request.getParameter("selectCurso"))));
            request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(Integer.parseInt(request.getParameter("selectInstituicao"))));
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = LIST;
        } else if (action.equalsIgnoreCase("pesquisarDisciplinas")) {
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = LIST;

        } else {
            //Adicionar disciplina
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = INSERT;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomeDisciplina = request.getParameter("nomeDisciplina");
        String action = (request.getParameter("action") == null ? "update" : "inserir") ;
        
        disciplina = new Disciplina();
        disciplina.setNome(nomeDisciplina);
        
        if (action.equalsIgnoreCase("inserir")) {
            int idInstituicao = Integer.parseInt(request.getParameter("selectInstituicao"));
            int idCurso = Integer.parseInt(request.getParameter("selectCurso"));
            
            disciplina.getCurso().setId(idCurso);
            daoDisciplina.insert(disciplina);
            request.setAttribute("curso",daoCurso.getCursoById(idCurso));
            request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(idInstituicao));
            request.setAttribute("idInstituicao",request.getParameter("selectInstituicao"));
            request.setAttribute("disciplinas",daoDisciplina.getAllDisciplinasByCurso(idCurso));
        }
        else{
            //Editar
            int idInstituicao  = Integer.parseInt(request.getParameter("idInstituicao"));
            int idCurso        = Integer.parseInt(request.getParameter("idCurso"));
            int idDisciplina   = Integer.parseInt(request.getParameter("idDisciplina"));
            
            
            disciplina.setId(idDisciplina);
            daoDisciplina.update(disciplina);
            
            request.setAttribute("idInstituicao",request.getParameter("idInstituicao"));
            request.setAttribute("disciplinas",daoDisciplina.getAllDisciplinasByCurso(idCurso));
            request.setAttribute("curso",daoCurso.getCursoById(idCurso));
            request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(idInstituicao));
            
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST);
        request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
        view.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
