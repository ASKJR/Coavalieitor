<%-- 
    Document   : sidebarLeftAluno
    Created on : 17/09/2016, 09:38:56
    Author     : Kato
--%>        
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-md-3 col-lg-2 sidebar-offcanvas" id="sidebar" role="navigation">
            <ul class="nav nav-pills nav-stacked">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/View/Aluno/listarTurmas.jsp">Turmas</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/View/Aluno/avaliacoes.jsp">Avaliações</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/View/Aluno/notas.jsp">Notas</a></li>
            </ul>
        </div>