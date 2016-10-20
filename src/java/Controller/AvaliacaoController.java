/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Avaliacao;
import Beans.Turma;
import Dao.AvaliacaoDao;
import Dao.TurmaDao;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AvaliacaoController", urlPatterns = {"/AvaliacaoController"})
public class AvaliacaoController extends HttpServlet {
    private static String INSERT_OR_EDIT = "View/Professor/addEditAvaliacao.jsp";
    private static String LIST = "View/Professor/listarAvaliacoesTurma.jsp";
   
    private AvaliacaoDao   daoAvaliacao;
    private TurmaDao       daoTurma;
    private Avaliacao      avaliacao;
    private Turma          turma;
    
    public AvaliacaoController(){
        daoAvaliacao = new AvaliacaoDao();
        daoTurma     = new TurmaDao();
        avaliacao    = new Avaliacao();
        turma        = new Turma();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward;
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete")) {
            forward = LIST;
        }
        else if (action.equalsIgnoreCase("edit")) {
            request.setAttribute("action","edit");
            forward = INSERT_OR_EDIT;
        }
        else if (action.equalsIgnoreCase("listarAvaliacoesPorTurma")) {
            request.setAttribute("turma",daoTurma.getTurmaById(Integer.parseInt(request.getParameter("idTurma"))));
            forward = LIST;
        }
        else {
            //Inserindo avaliação
            request.setAttribute("turma",daoTurma.getTurmaById(Integer.parseInt(request.getParameter("idTurma"))));
            request.setAttribute("action","inserir");
            forward = INSERT_OR_EDIT;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        String nomeAvaliacao          = request.getParameter("nomeAvaliacao");
        String descricao              = request.getParameter("descricao");
        String requisitosAdicionais   = request.getParameter("requisitosAdicionais");
        String periodoSubmissoes      = request.getParameter("periodoSubmissoes");
        String periodoCorrecoes       = request.getParameter("periodoCorrecoes");
        String numCorrecoes           = request.getParameter("numCorrecoes");
        String notaMaxima             = request.getParameter("notaMaxima");
        String criterio               = request.getParameter("criterio");
        String idTurma                = request.getParameter("idTurma");
        
        String[] periodoSubmissoesArray = periodoSubmissoes.split("-"); 
        String submissao_inicial = periodoSubmissoesArray[0].trim();
        String submissao_final   = periodoSubmissoesArray[1].trim();
        
        
        String[] periodoCorrecoesArray = periodoCorrecoes.split("-");
        String correcao_inicial = periodoCorrecoesArray[0].trim();
        String correcao_final   = periodoCorrecoesArray[1].trim();
       
        System.out.println(submissao_inicial + "---" + submissao_final);
        System.out.println(correcao_inicial  + "---"  + correcao_final);
        
        if (action.equalsIgnoreCase("inserir")) {
            
            avaliacao.setNome(nomeAvaliacao);
            avaliacao.setDescricao(descricao);
            avaliacao.setRequisito_adicional(requisitosAdicionais);
            avaliacao.setSubmissao_inicial(Utils.DateUtil.datetimeToDB(submissao_inicial));
            avaliacao.setSubmissao_final(Utils.DateUtil.datetimeToDB(submissao_final));
            avaliacao.setCorrecao_inicial(Utils.DateUtil.datetimeToDB(correcao_inicial));
            avaliacao.setCorrecao_final(Utils.DateUtil.datetimeToDB(correcao_final));
            avaliacao.setNum_correcao_estudante(Integer.parseInt(numCorrecoes));
            avaliacao.setNota_maxima(Integer.parseInt(notaMaxima));
            avaliacao.setCriterio_correcao(criterio);
            avaliacao.getTurma().setId(Integer.parseInt(idTurma));
            daoAvaliacao.insert(avaliacao);
        }
        else {
            //Editar
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
