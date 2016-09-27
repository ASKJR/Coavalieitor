<%-- 
    Document   : curso
    Created on : 26/09/2016, 22:49:19
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <form class="form-horizontal">
        <fieldset>
        <!-- Form Name -->
        <h2>Curso</h2>
        <hr>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput"><b>Nome da instituição:</b></label>  
            <div class="col-md-6">
                <select class="form-control" id="sel1">
                    <option>UFPR</option>
                    <option>POSITIVO</option>
                    <option>TUITI</option>
                    <option>PUCPR</option>
                </select>
            </div>
        </div><br><br>
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput"><b>Nome do curso:</b></label>  
            <div class="col-md-6">
                <input id="textinput" name="textinput" type="text" placeholder="Digite o nome do curso" class="form-control input-md" required>
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
    <hr>
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
                <td>Tecnologia em Negócios Imobiliários</td>
                <td> 
                    <button id="" name="" class="btn btn-danger">Deletar</button>
                    &nbsp
                    <button id="" name="" class="btn btn-info">Editar</button>
                </td>
            <tr>
            <tr>
                <td>1</td>
                <td>Tecnologia em Análise e Desenvolvimento de Sistemas</td>
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
