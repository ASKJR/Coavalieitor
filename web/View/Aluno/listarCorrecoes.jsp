<%-- 
    Document   : listarCorrecoes
    Created on : 02/10/2016, 00:41:51
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Lista de avalia��es dispon�veis para sua corre��o</h2>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Aluno</th>
                    <th>Corre��o</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tr>
                <td>0001</td>
                <td><a href="corrigirAvaliacao.jsp"> Avalia��o__0001 </a></td>
                <td>N�o corrigido</td>
            </tr>
            <tr>
                <td>0002</td>
                <td><a href="corrigirAvaliacao.jsp">Avalia��o__0002</a></td>
                <td>N�o corrigido</td>
            </tr>
        </table>
    </div>
</div>

<%@include file="../../include/footerProfessor.jsp" %>
