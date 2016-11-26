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

/**
 *
 * @author Kato
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
    
    private static String FWD    = "View/Professor/dashboard.jsp";
    
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
        
        GraficoFasesAvaliacao grafFasesAval = dashboardDao.getDadosGraficoFasesAvaliacao();
        request.setAttribute("avalNaoIniciadas", grafFasesAval.getNaoIniciadas());
        request.setAttribute("avalEmAndamento", grafFasesAval.getEmAndamento());            
        request.setAttribute("avalFinalizadas", grafFasesAval.getFinalizadas());
     
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
