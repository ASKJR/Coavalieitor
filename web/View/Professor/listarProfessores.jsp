<%-- 
    Document   : listarProfessores
    Created on : 04/09/2016, 21:55:18
    Author     : Kato
--%>
<%@include file="../../include/header.jsp" %>
<div class="container">
<nav class="navbar navbar-inverse">
    <div class="navbar-header">
        <a class="navbar-brand" href="ProfessorController">Professor index</a>
    </div>
    <ul class="nav navbar-nav">
        <li><a href="View/Professor/cadastrarProfessor.jsp">Cadastrar um professor</a>
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
                <a class="btn btn-small btn-info" href="View/Professor/cadastrarProfessor.jsp?update=${professor.id}&nome=${professor.nome}">Edit</a>
                <a class="btn btn-small btn-danger" href="ProfessorController?delete=${professor.id}">Delete</a>
            </td>
        </tr>
        </c:forEach>
    </tbody>
</table>
</div>
<%@include file="../../include/footer.jsp" %>

