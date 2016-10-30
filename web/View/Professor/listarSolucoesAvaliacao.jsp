<%-- 
    Document   : listarSubmissoes
    Created on : 29/09/2016, 22:11:59
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Listar submissões - ${avaliacao.nome}</h2> 
    <hr>
    <button class="btn btn-info"  onclick="window.history.back()">Voltar</button>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Aluno:</th>
                    <th style="text-align:center;">Solucão</th>
                    <th>Submetido em:</th>
                    <th>Status</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty solucoes}">
                    <c:forEach items="${solucoes}" var="solucao">
                        <tr>
                            <td>${solucao.aluno.user.nome}</td>
                            <td  style="text-align:center;">
                                <c:choose>
                                    <c:when test="${!empty solucao.solucao_data}">
                                        <button class=" open-Dialog"  data-toggle="modal" data-target="#myModal" data-solution="${solucao.resposta}" data-nome="${solucao.aluno.user.nome}">
                                            <span class="fa fa-eye" style="font-size: 25px;"></span>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        ${'--'}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                ${!empty solucao.solucao_data ? solucao.SD : '--'}
                            </td>
                            <td>     
                                ${!empty solucao.solucao_data ? 'OK' : 'Não submetido'}
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="4" align="center"><b>Nenhuma submissão encontrada no momento.</b></td></tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>
    
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
<%@include file="../../include/footerProfessor.jsp" %>
<script>
$(document).on("click", ".open-Dialog", function () {
    var nome             = $(this).data('nome');
    var solucaoSubmetida = $(this).data('solution');
    $(".modal-body #solucaoAluno").val( solucaoSubmetida );
    $("#nomeAluno").html(nome);
});
</script>
