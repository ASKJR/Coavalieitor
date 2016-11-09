<%-- 
    Document   : addEditCurso.jsp
    Created on : 05/10/2016, 21:01:31
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>${action == 'edit' ? "Editar" : "Novo"} Curso:</h2>
    <hr>
    <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/CursoController">
        <input type="hidden" name="action" value="${action}">
        <fieldset>
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput"><b>Nome da instituição:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectInstituicao" id="sel1">
                    <c:forEach items="${instituicoes}" var="instituicao"> 
                        <option value="${instituicao.id}"   ${action == 'edit'  ? (selected == instituicao.id ? 'selected':'disabled') : ''}>${instituicao.nome}</option>
                    </c:forEach>
                </select>
            </div>
        </div><br><br>
        <div class="form-group">
            <label class="col-md-3 control-label" for="lblCurso"><b>Nome do curso:</b></label>  
            <div class="col-md-6">
                <input id="textinput" value="${curso.nome}"name="nomeCurso" type="text" placeholder="Digite o nome do curso" class="form-control input-md" required>
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