<%-- 
    Document   : meuCadastro
    Created on : 26/09/2016, 20:02:16
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Configurações da conta</h2>
    <hr>
    <%@include file="../../include/mensagem.jsp"%>
    <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/CadastroController">
        <input type="hidden" name="action" value="atualizarUser">
        <input type="hidden" name="idUser" value="${sessionScope.usuarioLogado.id}">
        <fieldset>
        <legend>Informações básicas</legend>
        <div class="form-group">
            <label class="col-md-2 control-label" for="labelNome"><b>Nome:</b></label>  
        <div class="col-md-6">
            <input name="nome" type="text" value="<c:out value="${sessionScope.usuarioLogado.nome}" />" placeholder="Nome completo" class="form-control input-md" required>
        </div>
        </div><br>
        <div class="form-group">
            <label class="col-md-2 control-label" for="labelEmail"><b>E-mail:</b></label>  
            <div class="col-md-6">
                <input name="email" type="email" readonly value="<c:out value="${sessionScope.usuarioLogado.email}" />" placeholder="email@domain.com" class="form-control input-md">
            </div>
        </div><br>
        <div class="form-group">
            <label class="col-md-2 control-label" for="labeltelefone"><b>Telefone:</b></label>  
            <div class="col-md-6">
                <input id="telefone" name="telefone" type="text" value="<c:out value="${sessionScope.usuarioLogado.telefone}" />" placeholder="(99) 9999-9999" class="form-control input-md" required>
            </div>
        </div><br>
        <div class="form-group">
            <label class="col-md-2 control-label" for="labelNascimento"><b>Nascimento:</b></label>  
            <div class="col-md-6">
                <input id="calendario" name="nascimento" type="text" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${sessionScope.usuarioLogado.nascimento}'/>" placeholder="dd/mm/aaaa" class="form-control input-md" required>
            </div>
        </div><br>
        <div class="form-group">
            <label class="col-md-2 control-label" for="labelSexo"><b>Sexo:</b></label>
            <div class="col-md-6"> 
                <label class="radio-inline" for="lblMasculino">
                    <input type="radio" name="sexo" id="sexo-0" value="M" ${sessionScope.usuarioLogado.sexo == 'M'?'checked':''} required>
                    Masculino
                </label> 
                <label class="radio-inline" for="lblFeminino">
                <input type="radio" name="sexo" id="sexo-1" value="F" ${sessionScope.usuarioLogado.sexo == 'F'?'checked':''}>
                    Feminino
                </label>
            </div>
        </div><br>
        <div class="form-group">
            <label class="col-md-2 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Alterar</button>
            </div>
        </div>
        </fieldset>
    </form>
    <hr>
    <form id="trocarSenha" class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/CadastroController">
        <input type="hidden" name="idUser" value="${sessionScope.usuarioLogado.id}">
        <fieldset>
        <legend>Trocar senha</legend>
        <div class="form-group">
            <label class="col-md-2 control-label" for="labelcurrentSenha"><b>Senha atual:</b></label>  
            <div class="col-md-6">
                <input type="password" id="password" name="currentPassword"  class="validate[required] form-control input-md"/>
            </div>
        </div><br>
        <div class="form-group">
            <label class="col-md-2 control-label" for="labelnewPassword"><b>Nova senha:</b></label>  
            <div class="col-md-6">
                <input id="newPassword" type="password" name="newPassword"  class="validate[required,minSize[6],maxSize[50]] form-control input-md"/>
            </div>
        </div><br>
        <div class="form-group">
            <label class="col-md-2 control-label" for="labelrepeatSenha"><b>Repetir senha:</b></label>  
            <div class="col-md-6">
                <input id="repeatSenha" name="repeatPassword" type="password" class="validate[required,equals[newPassword]] form-control input-md" />
            </div>
        </div><br><br>
        <div class="form-group">
            <label class="col-md-2 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Trocar</button>
            </div>
        </div>
        </fieldset>
    </form>
    <hr>
</div>
<%@include file="../../include/footerProfessor.jsp" %>
<script>
$(document).ready(function(){
    $("#trocarSenha").validationEngine();
   });
</script>
