<%-- 
    Document   : notas
    Created on : 02/10/2016, 02:20:00
    Author     : Kato
--%>

<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Notas:</h2>
    <%@include file="../../include/mensagem.jsp" %>
    <hr>
    <br>
    <form class="form-horizontal" method="GET" action="${pageContext.request.contextPath}/GerarPDFController">
        <input type="hidden" name="getPDF" value="notaByAlunoTurma">
        <fieldset>
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeTurma>">
                <b>
                    Selecione sua turma: 
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Para visualizar as notas é necessário estar inscrito em uma turma!">
                        <i class="fa fa-question-circle" aria-hidden="true"></i>
                    </a>
                </b>
            </label>  
            <div class="col-md-6">
                <select class="form-control" id="selectTurma" name="selectTurma" required>
                    <option></option>
                    <c:forEach items="${matriculas}" var="matricula">
                        <option value="${matricula.turma.id}">
                            Professor: ${matricula.turma.professor.user.nome} - 
                            ${matricula.turma.disciplina.nome} -
                            ${matricula.turma.nome}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div><br><br>
        <div class="form-group">
            <label class="col-md-3 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Checar notas</button>
            </div>
        </div>
        </fieldset>
    </form>
    <hr>
</div>
<%@include file="../../include/footerAluno.jsp" %>