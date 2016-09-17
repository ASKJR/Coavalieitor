<%-- 
    Document   : side_bar-left
    Created on : 10/09/2016, 18:10:19
    Author     : Welyngton
--%>

<div class="col-sm-2">
    <nav class="nav-sidebar">
        <ul class="nav">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Professor</a></li>
            <li><a href="#">Aluno</a></li>
            <li><a href="#">Avaliação</a></li>
            <li class="nav-divider"></li>
            <li><a href="${pageContext.request.contextPath}/LoginController?redirect=true"><i class="glyphicon glyphicon-off"></i> Logout </a></li>
        </ul>
    </nav>
</div>