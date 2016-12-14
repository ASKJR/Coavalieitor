/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.GraficoFasesAvaliacao;
import Beans.Turma;
import ControllerAluno.*;
import Beans.Usuario;
import Dao.AvaliacaoDao;
import Dao.CorrecaoDao;
import Dao.CursoDao;
import Dao.DashboardDao;
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
import javax.xml.ws.spi.http.HttpContext;

/**
 *
 * @author Welyngton
 */
@WebServlet(name = "DashboardController", urlPatterns = {"/DashboardController"})
public class DashboardController extends HttpServlet {
    
    private InstituicaoDao daoInstituicao;
    private CursoDao       daoCurso;
    private DisciplinaDao  daoDisciplina;
    private TurmaDao       daoTurma;
    private Turma          turma;    
    private DashboardDao   dashboardDao;     
    
    public DashboardController(){
        super();
        daoRelatorio = new RelatorioDao();
        daoInstituicao = new InstituicaoDao();
        daoCurso       = new CursoDao();
        daoDisciplina  = new DisciplinaDao();
        daoTurma       = new TurmaDao();
        turma          = new Turma();
    }    
    
    private static String FWD    = "View/Professor/indexProfessor.jsp";
    
    private RelatorioDao daoRelatorio;
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        processRequest(request,response);        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request,response);
    }
    
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

         //Pegando as informações do aluno na sessão
        HttpSession session = request.getSession();
        Usuario aluno = (Usuario) session.getAttribute("usuarioLogado");
//        int idAluno = aluno.getId();
        
        Usuario professor;
        professor = (Usuario) session.getAttribute("usuarioLogado");
        int idProfessor = professor.getId();        
        
        String forward = FWD;
        String action = request.getParameter("action");   
        if(action.equalsIgnoreCase("carregarDashBoard")){
            System.out.println("carregar dash");
            carregarDashboard(idProfessor, request);
        }       
     
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    private void carregarDashboard(int idProfessor, HttpServletRequest request) {
               
        AvaliacaoDao daoAvaliacao = new AvaliacaoDao();
        CorrecaoDao daoCorrecao = new CorrecaoDao();
        DashboardDao daoDashboard = new DashboardDao();
        int qtdAvaliacoes = daoAvaliacao.numAvaliacoesAbertasByProfessor(idProfessor);
        int qtdCorrecoes = daoCorrecao.numCorrecoesAbertasByProfessor(idProfessor);
        int qtdFeedbacks = daoCorrecao.numFeedbacksAbertosByProfessor(idProfessor);       
        request.setAttribute("avaliacoes",qtdAvaliacoes);
        request.setAttribute("correcoes",qtdCorrecoes);
        request.setAttribute("feedbacks",qtdFeedbacks);        
        GraficoFasesAvaliacao grafFasesAval = daoDashboard.getDadosGraficoFasesAvaliacao(idProfessor);
        request.setAttribute("avalNaoIniciadas", grafFasesAval.getNaoIniciadas());
        request.setAttribute("avalEmSubmissao", grafFasesAval.getEmSubmissão());            
        request.setAttribute("avalEmCorrecao", grafFasesAval.getEmCorrecao());           
        request.setAttribute("avalFinalizadas", grafFasesAval.getFinalizadas());   
        request.setAttribute("listaTopCorretores", daoDashboard.obterListaCorretores(idProfessor));
        request.setAttribute("listaMenoresNotas", daoDashboard.obterListaMenoresNotas(idProfessor));
        request.setAttribute("listaAvaliacoesMes", daoDashboard.obterListaAvaliacoesMes(idProfessor));
        request.setAttribute("listaCorrecoesMes", daoDashboard.obterListaCorrecoesMes(idProfessor));
        request.setAttribute("listaMediaMes", daoDashboard.obterListaMediaMes());
//        System.out.println(daoDashboard.obterListaMenoresNotas().get(0).getNome());
    }

}
