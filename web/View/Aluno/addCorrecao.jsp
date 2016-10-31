<%-- 
    Document   : corrigirAvaliacao
    Created on : 02/10/2016, 00:37:37
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Correção de solução - ${solucao.avaliacao.nome}</h2>
    <hr>
    <btn class="btn btn-info" onclick="window.history.back()">Voltar</btn>
    <hr>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
            <form method="POST" action="${pageContext.request.contextPath}/CorrecaoControllerAluno">
                <input type="hidden" name="idSolucao" value="${solucao.id}">
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Problema:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10" disabled>${solucao.avaliacao.descricao}</textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Requisitos adicionais:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10" disabled>${solucao.avaliacao.requisito_adicional}</textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Critérios de correção:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10" disabled>${solucao.avaliacao.criterio_correcao}</textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Resposta aluno (n):</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10" disabled>${solucao.resposta}</textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Seu comentário:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="comentario" rows="10" required></textarea>
                </div>
                 <div class="form-group ">
                    <label class="control-label " for="subject"><b>Sua nota:</b></label>
                    <input class="form-control" name="nota" type="number" min="1" step="1" max="${solucao.avaliacao.nota_maxima}" required>
                </div>
                <div class="form-group">
                    <div>
                        <button class="btn btn-primary " name="submit" type="submit">Submeter sua correção</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>

