<%-- 
    Document   : sidebarLeftAluno
    Created on : 17/09/2016, 09:38:56
    Author     : Kato
--%>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-md-3 col-lg-2 sidebar-offcanvas" id="sidebar" role="navigation">
            <ul class="nav nav-pills nav-stacked">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/TurmaControllerAluno?action=listarTurmas"><span class="glyphicon glyphicon-user"></span> Turmas</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/AvaliacaoControllerAluno?action=buscarAvaliacoes"><span class="glyphicon glyphicon-list-alt"></span> Avaliações</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/NotaControllerAluno?action=buscarNotas"><span class="glyphicon glyphicon-check"></span> Notas</a></li>
            </ul>
        </div>