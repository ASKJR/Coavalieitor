<%-- 
    Document   : cadastrarUsuario
    Created on : 09/09/2016, 19:51:06
    Author     : Kato
--%>

<%@include file="include/header.jsp" %>
  <div class="wrapper">
    <form class="form-signin" action="LoginController?logar=true" method="POST">       
        <h2 class="form-signin-heading">Coavalieitor</h2>
        <h4>Inscreva-se já:</h4>
        <input type="text" class="form-control" name="username" placeholder="Nome completo" required="" autofocus="" />
        <input type="email" class="form-control" name="username" placeholder="Email" required="" autofocus="" />
        <input type="text" name="username" class="form-control" id="calendario" placeholder="Aniversário" required="" autofocus="" />
        <label class="radio-inline">
            <input type="radio" name="gender">Masculino
        </label>
        <label class="radio-inline" style="margin-left: 36px;">
          <input type="radio" name="gender">Feminino
        </label> <br>
        <label class="radio-inline">
          <input type="radio" name="userType">Sou Professor
        </label>
        <label class="radio-inline">
          <input type="radio"  name="userType">Sou Estudante
        </label>
        <input type="password" class="form-control" name="password" placeholder="Senha" required=""/>      
        <button  class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button><br>
        <a href="login.jsp">Já possui uma conta? Acesse aqui</a> 
    </form>
  </div>
<%@include file="include/footer.jsp" %>