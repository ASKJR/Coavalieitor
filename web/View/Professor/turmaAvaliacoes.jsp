<%-- 
    Document   : turmaAvaliacoes
    Created on : 27/09/2016, 21:50:50
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Turma Exemplo - Avaliações</h2>
    <hr>
    <button id="" name="" class="btn btn-info"> + Nova avaliação</button>
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
                    <button id="" name="" class="btn btn-info">Listar correções</button>
                                     &nbsp
                    <button id="" name="" class="btn btn-info">Avaliar</button>
                </td>
            <tr>
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>

