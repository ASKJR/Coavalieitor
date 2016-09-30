<%-- 
    Document   : novaTurma
    Created on : 29/09/2016, 21:28:10
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <form class="form-horizontal">
        <fieldset>
        <!-- Form Name -->
        <h2>Inserir Turma</h2>
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
        
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeTurma"><b>Nome da turma:</b></label>  
            <div class="col-md-6">
                <input id="textinput" name="inputTurma" type="text" placeholder="Digite o nome da turma" class="form-control input-md" required>
            </div>
        </div><br><br>
        
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeTurma"><b>Senha da turma:</b></label>  
            <div class="col-md-6">
                <input id="textinput" name="inputTurma" type="password" placeholder="Digite uma senha para que alunos consigam acessar essa turma" class="form-control input-md" required>
            </div>
        </div><br><br>
        
        
        
        <!-- Button -->
        <div class="form-group">
            <label class="col-md-3 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Inserir turma</button>
            </div>
        </div>
        </fieldset>
    </form>
</div>
<%@include file="../../include/footerProfessor.jsp" %>
