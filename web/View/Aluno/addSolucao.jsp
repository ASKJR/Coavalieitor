<%-- 
    Document   : resolverAvaliacao
    Created on : 01/10/2016, 22:57:56
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Resolver avaliação - ${avaliacao.nome}</h2>
    <hr>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
            <form method="POST" action="SolucaoControllerAluno" onsubmit="return confirm('ATENÇÃO! Ao submeter sua resposta, a mesma não poderá mais ser alterada.Você tem certeza que deseja submeter essa resposta?');">
                <input type="hidden" name="idAvaliacao" value="${avaliacao.id}">
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Problema:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10" disabled>${avaliacao.descricao}</textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b></b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10" disabled>${avaliacao.requisito_adicional}</textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Sua resposta:</b></label>
                    <textarea class="form-control" cols="40" id="resposta" name="resposta" rows="10" required></textarea>
                </div>
                <div class="form-group">
                    <div>
                        <button class="btn btn-primary " name="submit" type="submit">Submeter sua resposta</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../include/footerAluno.jsp" %>

