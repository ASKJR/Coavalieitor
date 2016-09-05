<%-- 
    Document   : listarProfessores
    Created on : 04/09/2016, 21:55:18
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
<div class="container">
<nav class="navbar navbar-inverse">
    <div class="navbar-header">
        <a class="navbar-brand" href="ProcessListarProfessores">Professor index</a>
    </div>
    <ul class="nav navbar-nav">
        <li><a href="cadastrarProfessor.jsp">Cadastrar um professor</a>
    </ul>
</nav>
<h1>Todos os professores</h1>
<table class="table table-striped table-bordered">
    <thead>
        <tr>
            <td>ID</td>
            <td>Name</td>
            <td>Actions</td>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${professores}" var="professor">
        <tr>
            <td>${professor.id}</td>
            <td>${professor.nome}</td>
            <td>
                <a class="btn btn-small btn-info" href="atualizarProfessor.jsp?atualizar=${professor.id}&nome=${professor.nome}">Edit</a>
                <a class="btn btn-small btn-danger" href="ProcessListarProfessores?delete=${professor.id}">Delete</a>
            </td>
        </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>