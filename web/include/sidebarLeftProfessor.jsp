<%-- 
    Document   : side_bar-left
    Created on : 10/09/2016, 18:10:19
    Author     : Welyngton
--%>
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-md-3 col-lg-2 sidebar-offcanvas" id="sidebar" role="navigation">
            <ul class="nav nav-pills nav-stacked">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/View/Professor/indexProfessor.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/InstituicaoController?action=listarInstituicoes">Instituições</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/CursoController?action=pesquisarCursos">Cursos</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/DisciplinaController?action=pesquisarDisciplinas">Disciplinas</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/TurmaController?action=pesquisarTurmas">Turmas</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/View/Professor/relatorios.jsp">Relatórios</a></li>
            </ul>
        </div>
