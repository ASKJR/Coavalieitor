<%-- 
    Document   : instituicao
    Created on : 21/09/2016, 20:05:20
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/InstituicaoController">
        <input type="hidden" name="insert" value="insert">
        <fieldset>
        <!-- Form Name -->
        <h2>Instituição</h2>
        <hr>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput"><b>Nome da instituição:</b></label>  
            <div class="col-md-6">
                <input id="textinput" name="nome" type="text" placeholder="Instituição" class="form-control input-md" required>
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
            <c:forEach items="${instituicoes}" var="instituicao"> 
                <tr>
                    <td>${instituicao.id}</td>
                    <td>${instituicao.nome}</td>
                    <td>
                        <a class="btn btn-danger" href="${pageContext.request.contextPath}/InstituicaoController?delete=${instituicao.id}">Deletar</a>
                    &nbsp
                    <button id="" name="" class="btn btn-info">Editar</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>


<%@include file="../../include/footerProfessor.jsp" %>

