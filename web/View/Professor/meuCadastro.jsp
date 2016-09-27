<%-- 
    Document   : meuCadastro
    Created on : 26/09/2016, 20:02:16
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Configurações da conta</h2>
    <hr>
    <form class="form-horizontal">
        <fieldset>
        <!-- Form Name -->
        <legend>Informações básicas</legend>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="textinput"><b>Nome:</b></label>  
        <div class="col-md-6">
            <input id="textinput" name="textinput" type="text" placeholder="Nome completo" class="form-control input-md">
        </div>
        </div><br>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="email"><b>E-mail:</b></label>  
            <div class="col-md-6">
                <input id="email" name="email" type="text" placeholder="email@domain.com" class="form-control input-md" required="">
            </div>
        </div><br>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="telefone"><b>Telefone:</b></label>  
            <div class="col-md-6">
                <input id="telefone" name="telefone" type="text" placeholder="(99) 9999-9999" class="form-control input-md" required="">
            </div>
        </div><br>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="nascimento"><b>Nascimento:</b></label>  
            <div class="col-md-6">
                <input id="calendario" name="nascimento" type="text" placeholder="dd/mm/aaaa" class="form-control input-md">
            </div>
        </div><br>

        <!-- Multiple Radios (inline) -->
        <div class="form-group">
            <label class="col-md-2 control-label" for="sexo"><b>Sexo:</b></label>
            <div class="col-md-6"> 
                <label class="radio-inline" for="sexo-0">
                <input type="radio" name="sexo" id="sexo-0" value="m">
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
            <label class="col-md-2 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Alterar</button>
            </div>
        </div>

        </fieldset>
    </form>
    <hr>
    
    <form class="form-horizontal">
        <fieldset>
        <!-- Form Name -->
        <legend>Trocar senha</legend>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="currentSenha"><b>Senha atual:</b></label>  
            <div class="col-md-6">
                <input id="email" name="currentSenha" type="text" class="form-control input-md" required="">
            </div>
        </div><br>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="newSenha"><b>Nova senha:</b></label>  
            <div class="col-md-6">
                <input id="telefone" name="newSenha" type="text" class="form-control input-md" required="">
            </div>
        </div><br>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-2 control-label" for="repeatSenha"><b>Repetir senha:</b></label>  
            <div class="col-md-6">
                <input id="telefone" name="repeatSenha" type="text" class="form-control input-md" required="">
            </div>
        </div><br><br>
        <!-- Button -->
        <div class="form-group">
            <label class="col-md-2 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Trocar</button>
            </div>
        </div>
        </fieldset>
    </form>
</div>
<%@include file="../../include/footerProfessor.jsp" %>