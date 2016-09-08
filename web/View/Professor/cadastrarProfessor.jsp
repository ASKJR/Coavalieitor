<%-- 
    Document   : cadastroProfessor
    Created on : 31/08/2016, 22:30:16
    Author     : Kato
--%>
<%@include file="../../include/header.jsp" %>
<form class="form-inline"  method="POST" action="${pageContext.request.contextPath}/ProfessorController">
  <c:set var="btnLbl" value="Cadastrar"/>
  <c:set var="type" value="insert"/>
  <c:if test="${!empty param.update}">
    <c:set var="btnLbl" value="Atualizar"/>
    <c:set var="type" value="update"/>
  </c:if>
  <div class="form-group">
    <label>Nome do professor:</label>
    <input name="nome" type="text" required="true" value="${param.nome}"class="form-control" id="nome">
    <input name="${type}" type="hidden" id="${type}" value="${param.update}">
  </div>
  <button type="submit" class="btn btn-primary">  <c:out value="${btnLbl}"/> </button>
</form>
<%@include file="../../include/footer.jsp" %>
