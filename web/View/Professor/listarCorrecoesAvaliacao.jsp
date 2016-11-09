<%-- 
    Document   : listarCorrecoes
    Created on : 29/09/2016, 21:50:13
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Listar correções - ${avaliacao.nome}</h2>
    <hr>
        <button class="btn btn-info" onclick="window.history.back();">Voltar</button>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Submetido por:</th>
                    <th style="text-align:center;">Solução:
                    <th>Corrigido por:</th>
                    <th style="text-align:center;">Correção:</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty correcoes}">
                    <c:forEach items="${correcoes}" var="correcao">
                        <tr>
                            <td>${correcao.solucao.aluno.user.nome}</td>
                            <td  style="text-align:center;">
                                <button class="btn btn-primary open-Solucao" data-toggle="modal" data-target="#myModalSolucao" data-solution="${correcao.solucao.resposta}" data-nome="${correcao.solucao.aluno.user.nome}">
                                    <span class="fa fa-eye" style="font-size: 25px;"></span>
                                </button>
                            </td>
                            <td>${correcao.aluno.user.nome}</td>
                            <td style="text-align:center;">
                                <button  class="btn btn-success open-Correcao" data-toggle="modal" data-target="#myModalCorrecao" data-nome="${correcao.aluno.user.nome}" data-data="${correcao.CD}" data-comentario="${correcao.comentario}" data-nota="${correcao.nota}" >
                                    <span class="fa fa-eye" style="font-size: 25px;"></span>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="4" align="center"><b>Nenhuma correção encontrada no momento.</b></td></tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>
    
<!-- Modal Solução-->
<div class="modal fade" id="myModalSolucao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="nomeAluno"></h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group ">
                        <label class="control-label " for="name"><b>Solução submetida:</b> </label>
                        <textarea class="form-control" cols="40" id="solucaoAluno" name="message" rows="10" disabled></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal Correção-->
<div class="modal fade" id="myModalCorrecao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="corrigidoPor"></h4>
            </div>
            <div class="modal-body">
                <form>
                    
                    <div class="form-group ">
                        <label class="control-label " for="lblData"><b>Data correção:</b> </label>
                        <input class="form-control" type="text" id="dataCorrecao" name="dataCorrecao" disabled>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="lblComentario"><b>Comentário:</b> </label>
                        <textarea class="form-control" cols="40" id="comentarioCorrecao" name="comentario" rows="10" disabled></textarea>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="lblNota"><b>Nota:</b> </label>
                        <input class="form-control" type="text" id="nota" name="nota" disabled>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div> 

<%@include file="../../include/footerProfessor.jsp" %>
<script>
$(document).on("click", ".open-Solucao", function () {
    var nome             = $(this).data('nome');
    var solucaoSubmetida = $(this).data('solution');
    $(".modal-body #solucaoAluno").val( solucaoSubmetida );
    $("#nomeAluno").html('Submetido por: ' + nome);
});
$(document).on("click", ".open-Correcao", function () {
    var nome             = $(this).data('nome');
    var dataCorrecao     = $(this).data('data');
    var comentario       = $(this).data('comentario');
    var nota             = $(this).data('nota');
    $(".modal-body #dataCorrecao").val( dataCorrecao );
    $(".modal-body #comentarioCorrecao").val( comentario );
    $(".modal-body #nota").val( nota );
    $("#corrigidoPor").html('Corrigido Por: ' +nome);
});
</script>
