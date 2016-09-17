<%-- 
    Document   : alterarSenha
    Created on : 10/09/2016, 11:10:32
    Author     : Kato
--%>

<%@include file="include/header.jsp" %>
    <div class="wrapper">
        <form class="form-signin" action="LoginController?logar=true" method="POST">       
            <!--Testando possíveis logos-->
            <!--<h2 class="form-signin-heading">Coavalieitor</h2>-->
            <!--<img src="resource/img/logo.png" alt="Mountain View" style="width:314px;height:174px;">-->
            <img src="resource/img/logo2.png" alt="Mountain View" style="width:314px;height:135px;">
            <input type="text" class="form-control" name="username" placeholder="Email" required="" autofocus="" /><br>
            <button  class="btn btn-lg btn-primary btn-block" type="submit">Mandar nova senha por email</button><br>
            <a href="cadastrarUsuario.jsp">Ainda não possui uma conta? Cadastre-se já</a> 
        </form>
    </div>
<%@include file="include/footer.jsp" %>
