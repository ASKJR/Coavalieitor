<%-- 
    Document   : editTurma
    Created on : 12/10/2016, 12:55:24
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Editar Turma:</h2>
    <hr>
    <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/TurmaController">
        <input type="hidden" name="action" value="inserir">
        <fieldset>
        <div class="form-group">
            <label class="col-md-3 control-label" for="labelTurma"><b>Nome da turma:</b></label>  
            <div class="col-md-6">
                <input id="textinput" name="nomeTurma" type="text" placeholder="Digite o nome da turma" class="form-control input-md" required>
            </div>
        </div><br><br>
         <div class="form-group">
            <label class="col-md-3 control-label" for="labelChave"><b>Chave de acesso:</b></label>  
            <div class="col-md-6">
                <input id="nomeChave" name="nomeChave" type="text" placeholder="Digite a chave de acesso" class="form-control input-md" required>
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
</div>
<%@include file="../../include/footerProfessor.jsp" %>