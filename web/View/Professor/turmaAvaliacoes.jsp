<%-- 
    Document   : turmaAvaliacoes
    Created on : 27/09/2016, 21:50:50
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Turma Noturna - Avaliações</h2>
    <hr>
    <a href="avaliacao.jsp" class="btn btn-info">+ Nova avaliação</a>
    <br><br>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>#ID</th>
                    <th>Avaliação</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tr>
                <td>1</td>
                <td>Fatorial</td>
                <td> 
                    <button id="" name="" class="btn btn-danger">Deletar</button>
                    &nbsp
                    <button id="" name="" class="btn btn-info">Editar</button>
                     &nbsp
                    <a href="listarSubmissoes.jsp" class="btn btn-info">Listar submissões</a>
                     &nbsp
                    <a href="listarCorrecoes.jsp" class="btn btn-info">Listar correções</a>
                                     &nbsp
                    <a href="feedback.jsp" class="btn btn-info">Avaliar</a>
                </td>
            <tr>
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>

