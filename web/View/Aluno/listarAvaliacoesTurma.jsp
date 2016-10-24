<%-- 
    Document   : avaliacoesTurma
    Created on : 01/10/2016, 22:25:20
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>TurmaN1 - Avaliações:</h2>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Nome</th>
                    <th>Fase</th>
                    <th>Resolução</th>
                    <th>Correção</th>
                    <th>Nota Prof.</th>
                    <th>FeedBack Prof.</th>
                    
                </tr>
            </thead>
            <tr>
                <td>Tarefa1 - Fatorial</td>
                <td>Correção</td>
                <td>Já resolvido 01/10/2016</td>
                <td><a href="listarCorrecoes.jsp">Corrigir</a></td>
                <td>--</td>
                <td>--</td>
            </tr>
            <tr>
                <td>Tarefa2 - Fibonnaci</td>
                <td>Encerrado</td>
                <td>Já resolvido em 01/10/2016</td>
                <td>Correções efetuadas em 02/10/2016</td>
                <td>70</td>
                <td>Excelente trabalho</td>        
            </tr>
            
            <tr>
                <td>Tarefa3 - Caixeiro viajante</td>
                <td>Submissão</td>
                <td><a href="resolverAvaliacao.jsp">Resolver</a></td>
                <td>Período de correções não disponível</td>
                <td>--</td>
                <td>--</td>
            </tr>
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>


