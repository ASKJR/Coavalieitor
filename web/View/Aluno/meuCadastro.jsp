<%-- 
    Document   : meuCadastro
    Created on : 20/09/2016, 23:23:21
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="main">
    <form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Meu dados</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-1 control-label" for="textinput">Nome:</label>  
  <div class="col-md-8">
  <input id="textinput" name="textinput" type="text" placeholder="Nome completo" class="form-control input-md">
    
  </div>
</div><br>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-1 control-label" for="email">E-mail:</label>  
  <div class="col-md-4">
  <input id="email" name="email" type="text" placeholder="email@domain.com" class="form-control input-md" required="">
    
  </div>
</div><br>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-1 control-label" for="telefone">Telefone:</label>  
  <div class="col-md-4">
  <input id="telefone" name="telefone" type="text" placeholder="(99) 9999-9999" class="form-control input-md" required="">
    
  </div>
</div><br>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-1 control-label" for="nascimento">Nascimento:</label>  
  <div class="col-md-4">
  <input id="calendario" name="nascimento" type="text" placeholder="dd/mm/aaaa" class="form-control input-md">
    
  </div>
</div><br>

<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-1 control-label" for="sexo">Sexo:</label>
  <div class="col-md-4"> 
    <label class="radio-inline" for="sexo-0">
      <input type="radio" name="sexo" id="sexo-0" value="m" checked="checked">
      Masculino
    </label> 
    <label class="radio-inline" for="sexo-1">
      <input type="radio" name="sexo" id="sexo-1" value="f">
      Feminino
    </label>
  </div>
</div><br>

<!-- Button -->
<div class="form-group">
  <label class="col-md-1 control-label" for=""></label>
  <div class="col-md-4">
    <button id="" name="" class="btn btn-primary">Salvar</button>
  </div>
</div>

</fieldset>
</form>

</div>

<%@include file="../../include/footerAluno.jsp" %>