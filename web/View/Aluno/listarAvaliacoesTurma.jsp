<%-- 
    Document   : avaliacoesTurma
    Created on : 01/10/2016, 22:25:20
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>TurmaN1 - Avalia��es:</h2>
    <hr>
    <br>
    <h3>Submeter solu��es:</h3>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Avalia��o</th>
                    <th>Resolvido em:</th>
                    <th>Op��o</th>
                </tr>
            </thead>
            <tr>
                <td>Tarefa1 - Fatorial</td>
                <td>--</td>
                <td><a class="btn btn-primary" href="resolverAvaliacao.jsp">Resolver</a></td>
            </tr>
            <tr>
                <td>Tarefa2 - Fibonnaci</td>
                <td>--</td>
                <td><a class="btn btn-primary" href="resolverAvaliacao.jsp">Resolver</a></td>
            </tr>
            
            <tr>
                <td>Tarefa3 - Caixeiro viajante</td>
                <td>--</td>
                <td><a class="btn btn-primary" href="resolverAvaliacao.jsp">Resolver</a></td>
            </tr>
        </table>
    </div>
    <br><br><br><br>
    <h3>Corrigir solu��es:</h3>
    <hr>
   <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Avalia��o</th>
                    <th>Corrigido em:</th>
                    <th>Op��o</th>
                </tr>
            </thead>
            <tr>
                <td>Tarefa1 - Fatorial</td>
                <td>--</td>
                <td><a class="btn btn-warning" href="listarCorrecoes.jsp">Corrigir</a></td>
            </tr>
            <tr>
                <td>Tarefa2 - Fibonnaci</td>
                <td>--</td> 
                <td><a class="btn btn-warning" href="listarCorrecoes.jsp">Corrigir</a></td>
            </tr>
            
            <tr>
                <td>Tarefa3 - Caixeiro viajante</td>
                <td>--</td>
                <td><a class="btn btn-warning" href="listarCorrecoes.jsp">Corrigir</a></td>
            </tr>
        </table>
    </div>
    <br><br><br><br>
    <h3>Pontua��o e coment�rios do Professor:</h3>
    <hr>
   <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Avalia��o</th>
                    <th>Nota Prof.</th>
                    <th>FeedBack Prof.</th>
                    
                </tr>
            </thead>
            <tr>
                <td>Tarefa1 - Fatorial</td>
                <td>--</td>
                <td>--</td>
            </tr>
            <tr>
                <td>Tarefa2 - Fibonnaci</td>
                <td>70</td>
                <td>Excelente trabalho</td>        
            </tr>
            
            <tr>
                <td>Tarefa3 - Caixeiro viajante</td>
                <td>--</td>
                <td>--</td>
            </tr>
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>


