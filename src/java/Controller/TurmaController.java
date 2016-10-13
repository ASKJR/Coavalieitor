/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Disciplina;
import Beans.Turma;
import Beans.Usuario;
import Dao.CursoDao;
import Dao.DisciplinaDao;
import Dao.InstituicaoDao;
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
@WebServlet(name = "TurmaController", urlPatterns = {"/TurmaController"})
public class TurmaController extends HttpServlet {
    
    private static String INSERT  = "View/Professor/addTurma.jsp";
    private static String EDIT    = "View/Professor/editTurma.jsp";
    private static String LIST    = "View/Professor/listarTurmas.jsp";
   
    
    private InstituicaoDao daoInstituicao;
    private CursoDao       daoCurso;
    private DisciplinaDao  daoDisciplina;
    private TurmaDao       daoTurma;
    private Turma          turma;
    
    
    public TurmaController(){
        super();
        daoInstituicao = new InstituicaoDao();
        daoCurso       = new CursoDao();
        daoDisciplina  = new DisciplinaDao();
        daoTurma       = new TurmaDao();
        turma          = new Turma();
    }
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String forward;
        String action = request.getParameter("action");
        
        if(action.equalsIgnoreCase("delete")){
            forward = LIST;
        } else if (action.equalsIgnoreCase("edit")) {
            forward = EDIT;
        } else if (action.equalsIgnoreCase("listarTurmasPorProfessor")) {
            forward = LIST;
        } else if (action.equalsIgnoreCase("pesquisarTurmas")) {
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = LIST;
        } else {
            //Adicionar turma
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = INSERT;
        }    
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nomeTurma = request.getParameter("nomeTurma");
        String nomeChave = request.getParameter("nomeChave");
        String action = (request.getParameter("action") == null ? "update" : "inserir") ;
        HttpSession session = request.getSession();
        
        if(nomeTurma!=null && nomeChave!=null){           
            //setando o nome da turma que vem do formulário
            turma.setNome(nomeTurma);
            if (action.equalsIgnoreCase("inserir")) {
                String idDisciplina = request.getParameter("selectDisciplina");
                Usuario user    = (Usuario) session.getAttribute("usuarioLogado");
                turma.setPalavra_chave(nomeChave);
                turma.getProfessor().setId(user.getId());
                turma.getDisciplina().setId(Integer.parseInt(idDisciplina));
                daoTurma.insert(turma);
            }
            else{
                //Editar turma
            }
            RequestDispatcher view = request.getRequestDispatcher(LIST);
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            view.forward(request, response);
        }
        else{
            try (PrintWriter out = response.getWriter()) {
                out.print("Nome de turma inválido!");
            }
        }
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
