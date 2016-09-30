<%-- 
    Document   : relatorios
    Created on : 29/09/2016, 22:27:27
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Relatórios</h2>
    <hr>
    <form class="form-horizontal">
        <fieldset>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeInstituicao"><b>Tipo de relatório:</b></label>  
            <div class="col-md-6">
                <select class="form-control" id="selectInstituicao">
                    <option>Alunos ordenados por média</option>
                    <option>Alunos que mais efetuaram correções</option>
                    <option>Alunos agrupados por turmas</option>
                </select>
            </div>
        </div><br><br>
        
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput"><b>Período:</b></label>  
            <div class="col-md-6">
                <input id="textinput" name="rangedateonly" id="rangedateonly" type="text" class="form-control input-md">
            </div>
        </div><br><br>
        
        <div class="form-group">
                <label class="col-md-3 control-label" for=""></label>
                <div class="col-md-6">
                    <button id="" name="" class="btn btn-primary">Gerar relatório</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>
<%@include file="../../include/footerProfessor.jsp" %>