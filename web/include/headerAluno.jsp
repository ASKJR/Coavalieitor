<%-- 
    Document   : headerAluno
    Created on : 20/09/2016, 23:52:20
    Author     : Kato
--%>
<%@ include file="config.jsp" %>
<!--Checando permissões - Segurança-->
<c:if test="${sessionScope.usuarioLogado == null || sessionScope.usuarioLogado.perfil_id == 1 || sessionScope.usuarioLogado.perfil_id == 3 }">
    <c:redirect url="LogoutController"/>
</c:if>
<body class="body-after-login">
<nav class="navbar navbar-fixed-top navbar-dark bg-primary">
    <a class="navbar-brand" href="#">Coavalieitor - Aluno</a>
    <div class="collapse navbar-toggleable-xs" id="collapsingNavbar">
        <ul class="nav navbar-nav pull-right">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/View/Aluno/meuCadastro.jsp">${sessionScope.usuarioLogado.nome}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/LogoutController">Logout</a>
            </li>
        </ul>
    </div>
</nav>
