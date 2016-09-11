<%-- 
    Document   : side_bar-left
    Created on : 10/09/2016, 18:10:19
    Author     : Welyngton
--%>

<div class="col-sm-2">
    <nav class="nav-sidebar">
        <ul class="nav">
            <li><a href="javascript:;">Dashboard</a></li>
            <li><a href="ProfessorController">Professor</a></li>
            <li><a href="javascript:;">Aluno</a></li>
            <li><a href="javascript:;">Avaliação</a></li>
            <li class="nav-divider"></li>
            <li><a href="${pageContext.request.contextPath}/LoginController?action=deslogar"><i class="glyphicon glyphicon-off"></i> Logout </a></li>
        </ul>
    </nav>
</div>