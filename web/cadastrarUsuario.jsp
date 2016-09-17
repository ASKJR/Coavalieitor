<%-- 
    Document   : cadastrarUsuario
    Created on : 09/09/2016, 19:51:06
    Author     : Kato
--%>

<%@include file="include/header.jsp" %>
  <div class="wrapper">
    <form class="form-signin" action="${pageContext.request.contextPath}/UsuarioController" method="POST">       
        <!--Testando possíveis logos-->
        <!--<h2 class="form-signin-heading">Coavalieitor</h2>-->
        <!--<img src="resource/img/logo.png" alt="Mountain View" style="width:314px;height:174px;">-->
        <img src="resource/img/logo2.png" alt="Mountain View" style="width:314px;height:135px;">
        <h4>Inscreva-se já:</h4>
        <%@include file="include/mensagem.jsp"%>
        <label class="radio-inline">
            <input type="radio" name="userType" value="professor" required>Sou Professor
        </label>
        <label class="radio-inline">
          <input type="radio"  name="userType" value="estudante" required>Sou Estudante
        </label>
        <br><br>
        <input type="email" class="form-control" name="email" placeholder="Email" required="" autofocus="" />
        <input type="password" class="form-control" name="senha" placeholder="Senha" required=""/>      
        <button  class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button><br>
        <a href="login.jsp">Já possui uma conta? Acesse aqui</a> 
    </form>
  </div>
<%@include file="include/footer.jsp" %>