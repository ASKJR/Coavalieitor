/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Usuario;
import Dao.UsuarioDao;
import Utils.Email;
import Utils.SenhaUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
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
@WebServlet(name = "RecuperarSenhaController", urlPatterns = {"/RecuperarSenhaController"})
public class RecuperarSenhaController extends HttpServlet { 
    private static String SHOW = "alterarSenha.jsp";
    private UsuarioDao daoUsuario;
    private Usuario usuario;
    HttpSession session;
    
    public RecuperarSenhaController(){
        daoUsuario = new UsuarioDao();
        usuario = new Usuario();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        session = request.getSession();
        if(email!=null){
            //E-mail não existe nos sistema
            if(!daoUsuario.emailExists(email)){
                session.setAttribute("mensagemErro", "E-mail não cadastrado no sistema.");
            }
            else{
                //Gerar senha alfaNumerica de 8 caracteres
                String senhaTemp    = SenhaUtil.gerarSenha();
                //Atualizar nova senha temporária no banco de dados
                daoUsuario.updateSenhaByEmail(senhaTemp, email);
                //Dados do e-mail
                String destinatario = email;
                String assunto      = "Coavalieitor - Senha temporária";
                String mensagem     = "Senha temporária: " + senhaTemp + "<br><br>Atenciosamente,<br><br>Coavalieitor TEAM.";
                try {
                    Email.enviarEmail(destinatario,assunto,mensagem);
                } catch (MessagingException ex) {
                    Logger.getLogger(RecuperarSenhaController.class.getName()).log(Level.SEVERE, null, ex);
                }
                //Mensagem de sucesso para o usuário
                session.setAttribute("mensagemSucesso", "Nova senha enviada...");
            }
        }
        else{
            try (PrintWriter out = response.getWriter()) {
                out.print("E-mail inválido!");
            }
        }
        RequestDispatcher view = request.getRequestDispatcher(SHOW);
        view.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
