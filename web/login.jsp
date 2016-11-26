<%-- 
    Document   : Login
    Created on : 07/09/2016, 16:00:16
    Author     : Welyngton
--%>

<%@include file="include/header.jsp" %>

    <div class="wrapper">
        <form class="form-signin" action="LoginController?logar=true" method="POST">
            <!--Testando possíveis logos-->
            <!--<h2 class="form-signin-heading">Coavalieitor</h2>-->
            <!--<img src="resource/img/logo.png" alt="Mountain View" style="width:314px;height:174px;">-->
            <img src="resource/img/logo2.png" alt="Mountain View" style="width:314px;height:135px;">
            <%@include file="include/mensagem.jsp"%> 
            <input type="text" class="form-control" name="email" placeholder="Email" required="" autofocus="" />
            <input type="password" class="form-control" name="senha" placeholder="Senha" required=""/>      
            <button  class="btn btn-lg btn-primary btn-block" type="submit">Login</button><br>
            <a href="alterarSenha.jsp">Esqueceu sua senha?</a><br>
             <a href="cadastrarUsuario.jsp">Ainda não possui uma conta? Cadastre-se já</a> 
        </form>
    </div>
            
<%@include file="include/footer.jsp" %>
