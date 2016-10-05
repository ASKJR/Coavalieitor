package Controller;

import Beans.Instituicao;
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
@WebServlet(name = "InstituicaoController", urlPatterns = {"/InstituicaoController"})
public class InstituicaoController extends HttpServlet {
    
    private static String INSERT_OR_EDIT = "View/Professor/addEditInstituicoes.jsp";
    private static String LIST_INST = "View/Professor/listarInstituicoes.jsp";
    private InstituicaoDao dao;
    private Instituicao inst;
    
    public InstituicaoController(){
        super();
        dao = new InstituicaoDao();
        inst = new Instituicao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String forward;
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")){
            int instituicaoId = Integer.parseInt(request.getParameter("id"));
            inst.setId(instituicaoId);
            dao.delete(inst);
            forward = LIST_INST;
            request.setAttribute("instituicoes", dao.getAllInstituicoes());
            
        } else if (action.equalsIgnoreCase("edit")){
            int instituicaoId = Integer.parseInt(request.getParameter("id"));
            inst = dao.getInstituicaoById(instituicaoId);
            request.setAttribute("instituicao",inst);
            forward = INSERT_OR_EDIT;
            
        } else if (action.equalsIgnoreCase("listarInstituicoes")){
            request.setAttribute("instituicoes", dao.getAllInstituicoes());
             forward = LIST_INST;
             
        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        inst.setNome(request.getParameter("nome"));
        String instituicaoid = request.getParameter("id");
        
        if(instituicaoid == null || instituicaoid.isEmpty()){
            dao.insert(inst);
        }
        else{
            inst.setId(Integer.parseInt(instituicaoid));
            dao.update(inst);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_INST);
        request.setAttribute("instituicoes", dao.getAllInstituicoes());
        view.forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}