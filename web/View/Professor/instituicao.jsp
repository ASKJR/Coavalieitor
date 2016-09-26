<%-- 
    Document   : instituicao
    Created on : 21/09/2016, 20:05:20
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <form class="form-horizontal">
        <fieldset>
        <!-- Form Name -->
        <legend>Instituição</legend>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput"><b>Nome da instituição:</b></label>  
            <div class="col-md-6">
                <input id="textinput" name="textinput" type="text" placeholder="Instituição" class="form-control input-md" required>
            </div>
        </div><br><br>
        <!-- Button -->
        <div class="form-group">
            <label class="col-md-3 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Salvar</button>
            </div>
        </div>
        </fieldset>
    </form>
    <br>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>#ID</th>
                    <th>Nome</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tr>
                <td>1</td>
                <td>Universidade Federal do Paraná</td>
                <td> 
                    <button id="" name="" class="btn btn-danger">Deletar</button>
                    &nbsp
                    <button id="" name="" class="btn btn-info">Editar</button>
                </td>
            <tr>
            <tr>
                <td>1</td>
                <td>Pontifícia Universidade Católica do Paraná</td>
                <td> 
                    <button id="" name="" class="btn btn-danger">Deletar</button>
                    &nbsp
                    <button id="" name="" class="btn btn-info">Editar</button>
                </td>
            <tr>
        </table>
    </div>
</div>


<%@include file="../../include/footerProfessor.jsp" %>

