<%-- 
    Document   : avaliacoes
    Created on : 01/10/2016, 22:09:54
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Avalia��es:</h2>
    <hr>
    <form class="form-horizontal" action="avaliacoesTurma.jsp">
        <fieldset>
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeTurma>"><b>Selecione sua turma:</b></label>  
            <div class="col-md-6">
                <select class="form-control" id="selectTurma">
                    <option> -- </option>
                    <option>TurmaN1</option>
                </select>
            </div>
        </div><br><br>
        <!-- Button -->
        <div class="form-group">
            <label class="col-md-3 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Checar avalia��es</button>
            </div>
        </div>
        </fieldset>
    </form>
    
</div>
<%@include file="../../include/footerAluno.jsp" %>
