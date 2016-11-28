/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Aluno;
import Beans.Curso;
import Beans.Disciplina;
import Dao.AlunoDao;
import Dao.CorrecaoFinalDao;
import Dao.CursoDao;
import Dao.DisciplinaDao;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kato
 */
@WebServlet(name = "AjaxController", urlPatterns = {"/AjaxController"})
public class AjaxController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        String idInst = request.getParameter("instituicaoId");
        String idCurs = request.getParameter("cursoId");
        String autocomplete = request.getParameter("autocomplete");
        String idAvaliacao = request.getParameter("idAvaliacao");
        
        //Requisição AJAX para o combobox de cursos 
        if(idInst!=null){
            if (!idInst.equals("")) {
                int instituicaoId = Integer.parseInt(idInst);
                CursoDao dao = new CursoDao();
                Curso c = new Curso();
                List<Curso> lc = dao.getAllCursosByInsituicao(instituicaoId);
                StringBuilder sb = new StringBuilder("");
                for(Curso cr : lc){
                    sb.append(cr.getId()+ "-" + cr.getNome()+ ":");    
                }
                out.write(sb.toString());
                System.out.println(sb.toString());
            }
        }
        //Requisição AJAX para o combobox de disciplinas 
        if(idCurs!=null){
            if (!idCurs.equals("")) {
                int cursoId = Integer.parseInt(idCurs);
                DisciplinaDao dao = new DisciplinaDao();
                Disciplina d      = new Disciplina();
                List<Disciplina> disciplinas = dao.getAllDisciplinasByCurso(cursoId);
                StringBuilder sb = new StringBuilder("");
                for(Disciplina disciplina : disciplinas){
                    sb.append(disciplina.getId()+ "-" + disciplina.getNome()+ ":");    
                }
                out.write(sb.toString());
            }
        }
        //Requisição AJAX para autoComplete de alunos
        if(autocomplete!=null){
            String like = request.getParameter("term");
            if(!autocomplete.equals("")){
                AlunoDao alunoDao = new AlunoDao();
                List<Aluno> alunoList = alunoDao.getAllAlunos(like);
                Gson gson = new Gson();
                List data = new ArrayList();
                HashMap<String, String> hashMap;
                for(Aluno aluno:alunoList){
                    hashMap = new HashMap<>();
                    hashMap.put("id",String.valueOf(aluno.getId()));
                    hashMap.put("label",aluno.getUser().getNome());
                    data.add(hashMap);
                }
                String json = gson.toJson(data);
                response.setContentType("application/json");
                response.getWriter().write(json);
            }
        }
        
        //Requisição AJAX para atualizar a visibilidade da correcao_final pelo
        //id da avaliação
        if(idAvaliacao!=null){
            String isCorrecaoVisible = request.getParameter("isCorrecaoVisible");
            if(!idAvaliacao.equals("")){
                boolean visible;
                int id = Integer.parseInt(idAvaliacao);
                if(isCorrecaoVisible.equalsIgnoreCase("true")){
                    visible = true;
                }
                else{
                    visible = false;
                }
                CorrecaoFinalDao daoCorrecaoFinal = new CorrecaoFinalDao();
                daoCorrecaoFinal.updateVisibilidadeCorrecao(id,visible);
            }
            out.write("ok");
        }
        
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
