<%-- 
    Document   : headerAluno
    Created on : 20/09/2016, 23:52:20
    Author     : Kato
--%>
<%@ include file="config.jsp" %>
<body class="body-after-login">
<nav class="navbar navbar-fixed-top navbar-dark bg-primary">
    <a class="navbar-brand" href="#">Coavalieitor - Aluno</a>
    <div class="collapse navbar-toggleable-xs" id="collapsingNavbar">
        <ul class="nav navbar-nav pull-right">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/View/Aluno/meuCadastro.jsp">Meu cadastro</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/LogoutController">Logout</a>
            </li>
        </ul>
    </div>
</nav>
