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
       

<c:if test="${sessionScope.mensagemSucesso != null}">
    <div class="alert alert-success">
       <button class="close" data-dismiss="alert" type="button">×</button>
                ${sessionScope.mensagemSucesso}
       <c:remove var="mensagemSucesso" scope="session" />
    </div>
</c:if>