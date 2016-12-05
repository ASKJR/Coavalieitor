<%-- 
    Document   : side_bar-left
    Created on : 10/09/2016, 18:10:19
    Author     : Welyngton
--%>

<tag> </tag>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-md-3 col-lg-2 sidebar-offcanvas" id="sidebar" role="navigation">
            <ul class="nav nav-pills nav-stacked">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/DashboardController?action=carregarDashboard"><span class="glyphicon glyphicon-list-alt"></span> Dashboard</a></li>                
                <!-- Menu disponível somente para PROFESSOR que é administrador -->
                <c:if test="${sessionScope.usuarioLogado.perfil_id == 1}">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/InstituicaoController?action=listarInstituicoes"><span class="glyphicon glyphicon-home"></span> Instituições</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/CursoController?action=pesquisarCursos"><span class="glyphicon glyphicon-briefcase"></span> Cursos</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/DisciplinaController?action=pesquisarDisciplinas"><span class="glyphicon glyphicon-book"></span> Disciplinas</a></li>
                </c:if> 
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/TurmaController?action=pesquisarTurmas"><span class="glyphicon glyphicon-user"></span> Turmas</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/RelatorioController?action=carregarRelatorios"><span class="glyphicon glyphicon-file"></span> Relatórios</a></li>
            </ul>
        </div>
