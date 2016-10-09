<%-- 
    Document   : editDisciplina
    Created on : 08/10/2016, 12:15:11
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Editar disciplina:</h2>
    <hr>
    <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/DisciplinaController">
        <input type="hidden" name="idInstituicao" value="${instituicao}">
        <input type="hidden" name="idCurso" value="${curso}">
        <input type="hidden" name="idDisciplina" value="${disciplina.id}">
        
        <fieldset>
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeDisciplina"><b>Nome da disciplina:</b></label>  
            <div class="col-md-6">
                <input id="textinput" name="nomeDisciplina" type="text" value="${disciplina.nome}" placeholder="Digite o nome da disciplina" class="form-control input-md" required>
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
