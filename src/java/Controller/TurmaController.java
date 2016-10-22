/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
        HttpSession session = request.getSession();
        String forward;
        String action = request.getParameter("action");
        //Pega dados de professor na sessão
        Usuario professor;
        professor = (Usuario) session.getAttribute("usuarioLogado");
        int idProfessor = professor.getId();
        
        if(action.equalsIgnoreCase("delete")){
            int idInstituicao   = Integer.parseInt(request.getParameter("idInstituicao"));
            int idCurso         = Integer.parseInt(request.getParameter("idCurso"));
            int idDisciplina    = Integer.parseInt(request.getParameter("idDisciplina"));
            int idTurma = Integer.parseInt(request.getParameter("idTurma"));
            turma.setId(idTurma);
            daoTurma.delete(turma);
            
            
            //Parametros para view
            request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(idInstituicao));
            request.setAttribute("curso",daoCurso.getCursoById(idCurso));
            request.setAttribute("disciplina",daoDisciplina.getDisciplinaById(idDisciplina));
            request.setAttribute("turmas",daoTurma.getAllTurmasByProfessor(idDisciplina, idProfessor));
            forward = LIST;
        } else if (action.equalsIgnoreCase("edit")) {
            int idInstituicao   = Integer.parseInt(request.getParameter("idInstituicao"));
            int idCurso         = Integer.parseInt(request.getParameter("idCurso"));
            int idDisciplina    = Integer.parseInt(request.getParameter("idDisciplina"));
            int idTurma         = Integer.parseInt(request.getParameter("idTurma"));
            
            //Parametros para view
            request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(idInstituicao));
            request.setAttribute("curso",daoCurso.getCursoById(idCurso));
            request.setAttribute("disciplina",daoDisciplina.getDisciplinaById(idDisciplina));  
            request.setAttribute("turma", daoTurma.getTurmaById(idTurma));
            forward = EDIT;
        } else if (action.equalsIgnoreCase("listarTurmasPorProfessor")) {
            
            int idInstituicao = Integer.parseInt(request.getParameter("selectInstituicao"));
            int idCurso       = Integer.parseInt(request.getParameter("selectCurso"));
            int idDisciplina  = Integer.parseInt(request.getParameter("selectDisciplina"));
            
            //Parametros para view
            request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(idInstituicao));
            request.setAttribute("curso",daoCurso.getCursoById(idCurso));
            request.setAttribute("disciplina",daoDisciplina.getDisciplinaById(idDisciplina));  
            request.setAttribute("turmas",daoTurma.getAllTurmasByProfessor(idDisciplina, idProfessor));
            forward = LIST;
            
        } else if (action.equalsIgnoreCase("pesquisarTurmas")) {
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = LIST;
        } else {
            //Adicionar turma
            request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
            forward = INSERT;
        }
        request.setAttribute("instituicoes", daoInstituicao.getAllInstituicoes());
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
        RequestDispatcher view;
        
        if(nomeTurma!=null && nomeChave!=null){           
            //setando o nome da turma que vem do formulário
            turma.setNome(nomeTurma);
            turma.setPalavra_chave(nomeChave);
            if (action.equalsIgnoreCase("inserir")) {
                
                Usuario user    = (Usuario) session.getAttribute("usuarioLogado");
                String instituicao = request.getParameter("selectInstituicao");
                String curso       = request.getParameter("selectCurso"); 
                String disciplina  = request.getParameter("selectDisciplina");
                
                int idInstituicao   = Integer.parseInt(instituicao);
                int idCurso         = Integer.parseInt(curso);
                int idDisciplina    = Integer.parseInt(disciplina);
                
                
           
                turma.getProfessor().setId(user.getId());
                turma.getDisciplina().setId(idDisciplina);
                daoTurma.insert(turma);
                
                //Parametros para view
                request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(idInstituicao));
                request.setAttribute("curso",daoCurso.getCursoById(idCurso));
                request.setAttribute("disciplina",daoDisciplina.getDisciplinaById(idDisciplina));  
                request.setAttribute("turmas",daoTurma.getAllTurmasByProfessor(idDisciplina,user.getId()));
                session.setAttribute("mensagemSucesso", "Turma adicionada com sucesso.");
          
                view = request.getRequestDispatcher(LIST);
            }
            else{
                //Editar turma
                //Pegando o id dos hiddens fields
                int idInstituicao   = Integer.parseInt(request.getParameter("idInstituicao"));
                int idCurso         = Integer.parseInt(request.getParameter("idCurso"));
                int idDisciplina    = Integer.parseInt(request.getParameter("idDisciplina"));
                int idTurma         = Integer.parseInt(request.getParameter("idTurma"));
                turma.setId(idTurma);
                daoTurma.update(turma);
                
               
                //Parametros para view
                request.setAttribute("instituicao",daoInstituicao.getInstituicaoById(idInstituicao));
                request.setAttribute("curso",daoCurso.getCursoById(idCurso));
                request.setAttribute("disciplina",daoDisciplina.getDisciplinaById(idDisciplina));  
               
                request.setAttribute("turma", daoTurma.getTurmaById(idTurma));
                session.setAttribute("mensagemSucesso", "Alterações atualizadas com sucesso.");
                view = request.getRequestDispatcher(EDIT);
            }
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
