<%-- 
    Document   : sidebarLeftAluno
    Created on : 17/09/2016, 09:38:56
    Author     : Kato
--%>        
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-md-3 col-lg-2 sidebar-offcanvas" id="sidebar" role="navigation">
            <ul class="nav nav-pills nav-stacked">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/TurmaControllerAluno?action=listarTurmas">Turmas</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/AvaliacaoControllerAluno?action=buscarAvaliacoes">Avaliações</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/NotaControllerAluno?action=buscarNotas">Notas</a></li>
            </ul>
        </div>