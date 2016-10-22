<%-- 
    Document   : avaliacao
    Created on : 27/09/2016, 22:13:41
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>${action eq 'edit' ? "Editar" : "Nova"} avalia��o:</h2>
    <c:set var="edit"
    value="${( action eq 'edit') ? '-' : ''}" />
    <hr>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
            <form method="POST" action="${pageContext.request.contextPath}/AvaliacaoController" >
                <input type="hidden" name="action" value="${action}">
                <input type="hidden" name="idTurma" value="${turma.id}">
                <input type="hidden" name="idAvaliacao" value="${avaliacao.id}">
                
                <div class="form-group ">
                    <label class="control-label " for="lblNomeAvaliacao"><b>Nome da avalia��o:</b> </label>
                    <input class="form-control" id="nomeAvaliacao" name="nomeAvaliacao" type="text" value="${avaliacao.nome}" required/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="lblDescricao"><b>Descri��o:</b></label>
                    <textarea class="form-control" cols="40" id="descricao" name="descricao" rows="10">${avaliacao.descricao}</textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="lblrequisitosAdicionais"><b>Requisitos adicionais:</b></label>
                    <textarea class="form-control" cols="40" id="requisitosAdicionais" name="requisitosAdicionais" rows="10">${avaliacao.requisito_adicional}</textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="name"><b>Per�odo de submiss�es:</b> </label>
                    <input class="form-control daterange" id="periodoSubmissoes" name="periodoSubmissoes" type="text" 
                    value="${avaliacao.SI} ${edit} ${avaliacao.SF}"/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="name"><b>Per�odo de corre��es:</b> </label>
                    <input class="form-control daterange" id="periodoCorrecoes" name="periodoCorrecoes" type="text" value="${avaliacao.CI} ${edit} ${avaliacao.CF}"/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="lblNumCorr"><b>N�mero de corre��es por estudante:</b> </label>
                    <input class="form-control" id="numCorrecoes" name="numCorrecoes" type="text" value="${avaliacao.num_correcao_estudante}"/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="lblNotaMaxima"><b>Nota m�xima:</b> </label>
                    <input class="form-control" id="notaMaxima" name="notaMaxima" type="text" value="${avaliacao.nota_maxima}"/>
                </div>
                 <div class="form-group ">
                    <label class="control-label " for="lblCriterios"><b>Crit�rios de corre��es:</b></label>
                    <textarea class="form-control" cols="40" id="criterio" name="criterio" rows="10">${avaliacao.criterio_correcao}</textarea>
                </div>
                <div class="form-group">
                    <div>
                        <button class="btn btn-primary " name="submit" type="submit">${action eq 'edit' ? "Salvar altera��es" : "Criar avalia��o"} </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>
