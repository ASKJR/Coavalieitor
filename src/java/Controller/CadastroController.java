/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Beans.Usuario;
import Dao.UsuarioDao;
import Utils.DateUtil;
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
@WebServlet(name = "CadastroController", urlPatterns = {"/CadastroController"})
public class CadastroController extends HttpServlet {
    private static String LIST = "";
    private UsuarioDao daoUsuario;
    private Usuario usuario;
    
    
    public CadastroController(){
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
        String modulo = (String)request.getSession().getAttribute("tipoUsuario");
        String action = request.getParameter("action") == null ? "trocarSenha" : "atualizarUsuario";
        if(modulo.equals("professor")){
            LIST = "View/Professor/meuCadastro.jsp";
        }
        else{
            LIST = "View/Aluno/meuCadastro.jsp";
        }
        
        if(action.equals("atualizarUsuario")){
            //Pegando valores do formulário
            String nome       = request.getParameter("nome");
            String email      = request.getParameter("email");
            String telefone   = request.getParameter("telefone");
            String nascimento = request.getParameter("nascimento");
            String sexo       = request.getParameter("sexo");
            int id            = Integer.parseInt(request.getParameter("idUser"));
            //Checando se informações não são nulas
            if(nome!=null && telefone!=null && nascimento!=null && sexo!=null && id!=0){
                //Setando informçãoes no objeto do tipo usuário   
                usuario.setNome(nome);
                usuario.setEmail(email);
                usuario.setTelefone(telefone);
                usuario.setNascimento(DateUtil.dateToDB(nascimento));
                usuario.setSexo(sexo);
                usuario.setId(id);
                //atualizando informações
                daoUsuario.update(usuario);
                request.getSession().setAttribute("mensagemSucesso", "Cadastro atualizado com sucesso!");
                request.getSession().setAttribute("usuarioLogado",usuario);
            }
            else{
                try (PrintWriter out = response.getWriter()) {
                    out.print("Erro: Parâmetros Nulos!!");
                }
            }
        }
        else{
            //Trocar senha
            String senhaAtual   = request.getParameter("currentPassword");
            String novaSenha    = request.getParameter("newPassword");
            String confereSenha = request.getParameter("repeatPassword");
            int id              = Integer.parseInt(request.getParameter("idUser"));
            
            //Checando parâmetros
            if(senhaAtual!=null && novaSenha!=null && confereSenha!=null){
                if(!novaSenha.equals(confereSenha)){
                    try (PrintWriter out = response.getWriter()) {
                        out.print("Erro: senhas digitadas nao conferem!!");
                    }
                }
                else{
                    usuario.setSenha(senhaAtual);
                    usuario.setId(id);
                    //Verifica se a senha atual que está no banco confere com a senha digitada
                    if(daoUsuario.senhaConfere(usuario)){
                        //atualiza senha
                        usuario.setSenha(novaSenha);
                        daoUsuario.updateSenha(usuario);
                        request.getSession().setAttribute("mensagemSucesso", "Senha atualizada com sucesso.");
                    }
                    else{
                        //Mostrar mensagem de erro: Senha atual digitada não confere com senha do DB.
                        request.getSession().setAttribute("mensagemErro", "Senha atual não confere com a senha digitada.");
                    }
                }
            }
            else{
                try (PrintWriter out = response.getWriter()) {
                    out.print("Erro: Parâmetros Nulos!!");
                }
            }
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST);
        view.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
