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
    <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/CursoController">
        <input type="hidden" name="listarCursoPorInst" value="true">
        <fieldset>
        <!-- Form Name -->
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput"><b>Nome da instituição:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectInstituicao" id="sel1">
                    <c:forEach items="${instituicoes}" var="instituicao"> 
                        <option value="${instituicao.id}" ${selected == instituicao.id ? 'selected' : ' '}>${instituicao.nome}</option>
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
            <c:forEach items="${cursos}" var="curso">
                <tr>
                    <td>${curso.id}</td>
                    <td>${curso.nome}</td>
                    <td></td>
                </tr>
            </c:forEach>

            <!--<tr>
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
            <tr>-->
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>
