<%-- 
    Document   : mensagem
    Created on : 11/09/2016, 20:47:51
    Author     : Kato
--%>

<c:if test="${sessionScope.mensagemErro != null}">
    <div class="alert alert-danger">
       <button class="close" data-dismiss="alert" type="button">×</button>
                ${sessionScope.mensagemErro}
       <c:remove var="mensagemErro" scope="session" />
    </div>
</c:if>