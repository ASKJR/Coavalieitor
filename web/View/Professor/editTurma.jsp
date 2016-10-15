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
     <a href="${pageContext.request.contextPath}/TurmaController?action=listarTurmasPorProfessor&selectInstituicao=${instituicao.id}&selectCurso=${curso.id}&selectDisciplina=${turma.disciplina.id}" class="btn btn-info"> Voltar </a><br>
    <hr>
    <%@include file="../../include/mensagem.jsp" %>
    <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/TurmaController">
        <input type="hidden" name="idInstituicao" value="${instituicao.id}">
        <input type="hidden" name="idCurso"       value="${curso.id}">
        <input type="hidden" name="idDisciplina"  value="${disciplina.id}">
        <input type="hidden" name="idTurma"       value="${turma.id}">
        <fieldset>
        <div class="form-group">
            <label class="col-md-3 control-label" for="labelTurma"><b>Nome da turma:</b></label>  
            <div class="col-md-6">
                <input id="textinput" name="nomeTurma" type="text" value="${turma.nome}" class="form-control input-md" required>
            </div>
        </div><br><br>
         <div class="form-group">
            <label class="col-md-3 control-label" for="labelChave"><b>Chave de acesso:</b></label>  
            <div class="col-md-6">
                <input id="nomeChave" name="nomeChave" type="text" value="${turma.palavra_chave}" class="form-control input-md" required>
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