<%-- 
    Document   : cadastroProfessor
    Created on : 31/08/2016, 22:30:16
    Author     : Kato
--%>

<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form class="form-inline"  method="POST" action="ProfessorController">
  <c:set var="btnLbl" value="Cadastrar"/>
  <c:set var="type" value="insert"/>
  <c:if test="${!empty param.update}">
    <c:set var="btnLbl" value="Atualizar"/>
    <c:set var="type" value="update"/>
  </c:if>
  <div class="form-group">
    <label>Nome do professor:</label>
    <input name="nome" type="text" required="true" value="${param.nome}"class="form-control" id="nome">
    <input name="${type}" type="hidden" id="${type}" value="${param.update}">
  </div>
  <button type="submit" class="btn btn-primary">  <c:out value="${btnLbl}"/> </button>
</form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>