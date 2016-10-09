/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Curso;
import Dao.CursoDao;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
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
        String id = request.getParameter("instituicaoId");
        if(!id.equals("")){
            int instituicaoId = Integer.parseInt(id);
            CursoDao dao = new CursoDao();
            Curso c = new Curso();
            List<Curso> lc = dao.getAllCursosByInsituicao(instituicaoId);
            StringBuilder sb = new StringBuilder("");
            for(Curso cr : lc){
                sb.append(cr.getId()+ "-" + cr.getNome()+ ":");    
            }
            out.write(sb.toString());
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
