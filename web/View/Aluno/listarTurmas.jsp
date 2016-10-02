<%-- 
    Document   : listarTurmas
    Created on : 01/10/2016, 21:14:14
    Author     : Kato
--%>

<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Turmas disponíveis:</h2>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Turma</th>
                    <th>Instituição / Curso / Disciplina/</th>
                    <th>Opções</th>
                    
                </tr>
            </thead>
            <tr>
                <td>TurmaN1</td>
                <td>UFPR / TADS / AlG1</td>
                <td>
                    <button class="btn btn-success"  disabled data-toggle="modal" data-target="#myModal">Inscreva-me</button>
                </td>
            </tr>
            <tr>
                <td>TurmaPxk</td>
                <td>PUC-PR / Medicina / Biologia1</td>
                <td>
                    <button class="btn btn-success" data-toggle="modal" data-target="#myModal">Inscreva-me</button>
                </td>        
            </tr>
            
            <tr>
                <td>Turma-2012</td>
                <td>POSITIVO / Sist.Inform / Banco de dados I</td>
                <td>
                    <button class="btn btn-success"  data-toggle="modal" data-target="#myModal">Inscreva-me</button>
                </td>
            </tr>
        </table>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Inscreva-se</h4>
            </div>
            <div class="modal-body">
                <form action="#" method="post">
                    <div class="form-group ">
                        <label class="control-label " for="name"><b>Senha:</b> </label>
                        <input class="form-control" id="name" name="senha" type="password"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" class="btn btn-primary">Entrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<%@include file="../../include/footerAluno.jsp" %>
