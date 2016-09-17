<%-- 
    Document   : 404
    Created on : 17/09/2016, 10:55:24
    Author     : Kato
--%>

<%@include file="include/header.jsp" %>
<div class="container">
  <div class="row">
    <div class="span12">
        <div class="jumbotron page404">
          <h1>Página não encontrada. <small><font face="Tahoma" color="red">Erro: 404</font></small></h1>
          <br />
          <p>A página que você acessou não existe em nosso servidor.</p>
          <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-large btn-info"> Ir para login</a>
        </div>
        <br>
</div>
      