<%-- 
    Document   : curso
    Created on : 26/09/2016, 22:49:19
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Cursos</h2>
    <hr>
    <a href="${pageContext.request.contextPath}/CursoController?action=inserir" class="btn btn-success">+ Adicionar</a>
    <hr>
    <form class="form-horizontal" method="GET" action="${pageContext.request.contextPath}/CursoController">
        <input type="hidden" name="action" value="listarCursoPorInst">
        <fieldset>
        <!-- Form Name -->
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput"><b>Nome da instituição:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectInstituicao" id="sel1">
                    <c:forEach items="${instituicoes}" var="instituicao"> 
                        <option value="${instituicao.id}" ${selected == instituicao.id ? 'selected' : ''}>${instituicao.nome}</option>
                    </c:forEach>
                </select>
            </div>
        </div><br><br>
        <!-- Button -->
        <div class="form-group">
            <label class="col-md-3 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Listar cursos</button>
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
            <c:choose>
                <c:when test="${!empty cursos}">
                    <c:forEach items="${cursos}" var="curso">
                        <tr>
                            <td>${curso.id}</td>
                            <td>${curso.nome}</td>
                            <td>
                                <a class="btn btn-info" href="${pageContext.request.contextPath}/CursoController?action=edit&idCurso=${curso.id}&idInstituicao=${curso.instituicao.id}">Editar</a>&nbsp
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/CursoController?action=delete&idCurso=${curso.id}&idInstituicao=${curso.instituicao.id}">Deletar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="3" align="center"><b>Nenhum registro encontrado, ou o botão listar cursos não foi pressionado.</b></td></tr>
                </c:otherwise>
            </c:choose>        
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>
