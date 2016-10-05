<%-- 
    Document   : addEditInstituicoes
    Created on : 04/10/2016, 19:51:24
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/InstituicaoController">
        <fieldset>
        <h2>${empty instituicao.id ? "Nova" : "Editar"} Instituição:</h2>
        <hr>
        <div class="form-group">
            <label class="col-md-3 control-label" for="lblInstituicao"><b>Nome da instituição:</b></label>  
            <div class="col-md-6">
                <input type="hidden" name="id" value="${instituicao.id}">
                <input name="nome" value="${instituicao.nome}" type="text" class="form-control input-md" required>
            </div>
        </div><br><br>
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
