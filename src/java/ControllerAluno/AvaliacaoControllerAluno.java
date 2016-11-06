/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControllerAluno;

import Beans.Matricula;
import Beans.Turma;
import Beans.Usuario;
import Dao.AvaliacaoDao;
import Dao.CorrecaoFinalDao;
import Dao.MatriculaDao;
import Dao.SolucaoDao;
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
@WebServlet(name = "AvaliacaoControllerAluno", urlPatterns = {"/AvaliacaoControllerAluno"})
public class AvaliacaoControllerAluno extends HttpServlet {

    private static String BUSCAR    = "View/Aluno/buscarAvaliacoes.jsp";
    private static String LIST      = "View/Aluno/listarAvaliacoesTurma.jsp";
    
    private TurmaDao            daoTurma;
    private Turma               turma;
    private MatriculaDao        daoMatricula;
    private Matricula           matricula;
    private AvaliacaoDao        daoAvaliacao;
    private SolucaoDao          daoSolucao;
    private CorrecaoFinalDao    daoCorrecaoFinal;
    
    public AvaliacaoControllerAluno(){
        daoTurma            = new TurmaDao();
        daoMatricula        = new MatriculaDao();
        turma               = new Turma();
        matricula           = new Matricula();
        daoAvaliacao        = new AvaliacaoDao();
        daoSolucao          = new SolucaoDao();
        daoCorrecaoFinal    = new CorrecaoFinalDao();
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
        
        if (action.equalsIgnoreCase("buscarAvaliacoes")){
            request.setAttribute("matriculas",daoMatricula.getMatriculaByAluno(idAluno));
            forward = BUSCAR;
        }
        else if (action.equalsIgnoreCase("listarAvaliacoesPorTurma")){
            String idTurma = request.getParameter("selectTurma");
            int id = Integer.parseInt(idTurma);
            session.setAttribute("idTurma",id);
            request.setAttribute("solucoesAluno",daoSolucao.getSolucoesByAluno(idAluno));
            request.setAttribute("turma",daoTurma.getTurmaById(id));
            request.setAttribute("avaliacoesSubmissao",daoAvaliacao.getAvaliacoesByTurmaByPhase(id,"SUBMISSAO"));
            request.setAttribute("avaliacoesCorrecao",daoAvaliacao.getAvaliacoesByTurmaByPhase(id,"CORRECAO"));
            request.setAttribute("correcoesFinais",daoCorrecaoFinal.getCorrecoesFinalByAluno(id,idAluno,true));
            forward = LIST;       
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
