<%-- 
    Document   : turma
    Created on : 27/09/2016, 20:10:36
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <form class="form-horizontal">
        <fieldset>
        <!-- Form Name -->
        <h2>Turma</h2>
        <hr>
        <a href="novaTurma.jsp" class="btn btn-info"> + Nova Turma </a><br>
        <hr>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeInstituicao"><b>Nome da institui��o:</b></label>  
            <div class="col-md-6">
                <select class="form-control" id="selectInstituicao">
                    <option>UFPR</option>
                    <option>POSITIVO</option>
                    <option>TUITI</option>
                    <option>PUCPR</option>
                </select>
            </div>
        </div><br><br>
        
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeCurso"><b>Nome do curso:</b></label>  
            <div class="col-md-6">
                <select class="form-control" id="selectCurso">
                    <option>Tecnologia em An�lise e Desenvolvimento de Sistemas</option>
                    <option>Tecnologia em Neg�cios Imobili�rios</option>
                </select>
            </div>
        </div><br><br>
        
        
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeDisciplina"><b>Nome da disciplina:</b></label>  
            <div class="col-md-6">
                <select class="form-control" id="selectDisciplina">
                    <option>Banco de dados I</option>
                    <option>Estrutura de dados II</option>
                </select>
            </div>
        </div><br><br>
        <!-- Button -->
        <div class="form-group">
            <label class="col-md-3 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Listar</button>
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
                    <th>A��es</th>
                </tr>
            </thead>
            <tr>
                <td>1</td>
                <td><a href="turmaAvaliacoes.jsp"> Turma Noturna</a></td>
                <td> 
                    <button id="" name="" class="btn btn-danger">Deletar</button>
                    &nbsp
                    <button id="" name="" class="btn btn-info">Editar</button>
                    &nbsp
                    <a href="listarAlunosTurma.jsp" class="btn btn-success">Alunos</a>
                </td>
            <tr>
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>

