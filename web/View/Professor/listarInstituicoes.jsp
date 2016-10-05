<%-- 
    Document   : instituicao
    Created on : 21/09/2016, 20:05:20
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Instituições</h2>
    <hr>
    <a href="${pageContext.request.contextPath}/View/Professor/addEditInstituicoes.jsp" class="btn btn-success">+ Adicionar</a>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>#ID</th>
                    <th>Nome</th>
                    <th align="center">Ações</th>
                </tr>
            </thead>
            <c:forEach items="${instituicoes}" var="instituicao"> 
                <tr>
                    <td>${instituicao.id}</td>
                    <td>${instituicao.nome}</td>
                    <td>
                        <a class="btn btn-info" href="${pageContext.request.contextPath}/InstituicaoController?action=edit&id=${instituicao.id}">Editar</a>
                        &nbsp
                        <a class="btn btn-danger" href="${pageContext.request.contextPath}/InstituicaoController?action=delete&id=${instituicao.id}">Deletar</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>

