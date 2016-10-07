/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Curso;
import Dao.CursoDao;
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
@WebServlet(name = "CursoController", urlPatterns = {"/CursoController"})
public class CursoController extends HttpServlet {
    private static String INSERT_OR_EDIT = "View/Professor/addEditCurso.jsp";
    private static String LIST = "View/Professor/listarCursos.jsp";
    private CursoDao dao;
    private InstituicaoDao daoInstituicao;
    private Curso curso;

    public CursoController(){
        super();
        dao = new CursoDao();
        daoInstituicao = new InstituicaoDao();
        curso = new Curso();
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String forward;
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")){
            int cursoId = Integer.parseInt(request.getParameter("idCurso"));
            curso.setId(cursoId);
            dao.delete(curso);
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            request.setAttribute("selected",request.getParameter("idInstituicao"));
            request.setAttribute("cursos", dao.getAllCursosByInsituicao(Integer.parseInt(request.getParameter("idInstituicao"))));
            forward = LIST;   
        } else if (action.equalsIgnoreCase("edit")){
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            int cursoId = Integer.parseInt(request.getParameter("idCurso"));
            
            request.setAttribute("action","edit");
            
            request.setAttribute("selected",request.getParameter("idInstituicao"));
            curso = dao.getCursoById(cursoId);
            request.setAttribute("curso",curso);
            forward = INSERT_OR_EDIT;
            
        }   else if(action.equalsIgnoreCase("listarCursoPorInst")){
            request.setAttribute("selected",request.getParameter("selectInstituicao"));
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            request.setAttribute("cursos", dao.getAllCursosByInsituicao(Integer.parseInt(request.getParameter("selectInstituicao"))));
            forward = LIST;
            
        }   else if (action.equalsIgnoreCase("pesquisarCursos")){
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = LIST;
             
        } else {
            //adicionar
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = INSERT_OR_EDIT;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomeCurso  = request.getParameter("nomeCurso");
        int idInstituicao = Integer.parseInt(request.getParameter("selectInstituicao"));   
        curso.getInstituicao().setId(idInstituicao);
        curso.setNome(nomeCurso);
   
        String update = request.getParameter("action");
        if(update.equals("")){
            dao.insert(curso);
        }
        else{
            dao.update(curso);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST);
         
        request.setAttribute("selected",idInstituicao);
        request.setAttribute("cursos", dao.getAllCursosByInsituicao(idInstituicao));
        request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
        view.forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
