<%-- 
    Document   : cadastrarUsuario
    Created on : 09/09/2016, 19:51:06
    Author     : Kato
--%>

<%@include file="include/header.jsp" %>
  <div class="wrapper">
    <form class="form-signin" action="${pageContext.request.contextPath}/UsuarioController" method="POST">       
        <c:set var="type" value="insert"/>
        <h2 class="form-signin-heading">Coavalieitor</h2>
        <h4>Inscreva-se já:</h4>
        <%@include file="include/mensagem.jsp"%>
        <label class="radio-inline">
          <input type="radio" name="userType">Sou Professor
        </label>
        <label class="radio-inline">
          <input type="radio"  name="userType">Sou Estudante
        </label>        
        <input type="email" class="form-control" value="${param.email}" name="email" placeholder="Email" required="" autofocus="" />
        <input type="password" class="form-control" value="${param.senha}" name="senha" placeholder="Senha" required=""/>      
        <button  class="btn btn-lg btn-primary btn-block" type="submit">Cadastrar</button><br>
        <a href="login.jsp">Já possui uma conta? Acesse aqui</a> 
        <input name="${type}" type="hidden" id="${type}" value="${param.update}">
    </form>
  </div>
<%@include file="include/footer.jsp" %>