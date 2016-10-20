<%-- 
    Document   : avaliacao
    Created on : 27/09/2016, 22:13:41
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Nova avaliação</h2>
    <hr>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
            <form method="POST" action="${pageContext.request.contextPath}/AvaliacaoController" >
                <input type="hidden" name="action" value="${action}">
                <input type="hidden" name="idTurma" value="${turma.id}">
                <div class="form-group ">
                    <label class="control-label " for="lblNomeAvaliacao"><b>Nome da avaliação:</b> </label>
                    <input class="form-control" id="nomeAvaliacao" name="nomeAvaliacao" type="text" required/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="lblDescricao"><b>Descrição:</b></label>
                    <textarea class="form-control" cols="40" id="descricao" name="descricao" rows="10"></textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="lblrequisitosAdicionais"><b>Requisitos adicionais:</b></label>
                    <textarea class="form-control" cols="40" id="requisitosAdicionais" name="requisitosAdicionais" rows="10"></textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="name"><b>Período de submissões:</b> </label>
                    <input class="form-control daterange" id="periodoSubmissoes" name="periodoSubmissoes"  type="text"/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="name"><b>Período de correções:</b> </label>
                    <input class="form-control daterange" id="periodoCorrecoes" name="periodoCorrecoes" type="text"/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="lblNumCorr"><b>Número de correções por estudante:</b> </label>
                    <input class="form-control" id="numCorrecoes" name="numCorrecoes" type="text"/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="lblNotaMaxima"><b>Nota máxima:</b> </label>
                    <input class="form-control" id="notaMaxima" name="notaMaxima" type="text"/>
                </div>
                 <div class="form-group ">
                    <label class="control-label " for="lblCriterios"><b>Critérios de correções:</b></label>
                    <textarea class="form-control" cols="40" id="criterio" name="criterio" rows="10"></textarea>
                </div>
                <div class="form-group">
                    <div>
                        <button class="btn btn-primary " name="submit" type="submit">Criar Avaliação</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>
