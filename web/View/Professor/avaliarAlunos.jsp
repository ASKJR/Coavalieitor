<%-- 
    Document   : avaliacaoFinal
    Created on : 28/09/2016, 23:34:40
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2> Avaliar Estudantes  - ${avaliacao.nome}</h2>
    <hr>
    <a href="${pageContext.request.contextPath}/AvaliacaoController?action=listarAvaliacoesPorTurma&idInstituicao=${sessionScope.idInstituicao}&idCurso=${sessionScope.idCurso}&idDisciplina=${sessionScope.idDisciplina}&idTurma=${sessionScope.idTurma}" class="btn btn-info">Voltar</a>
    <hr>
    <div class="checkbox">
        <label>
            <input type="checkbox" name="liberarNotas" id="liberarNotas" value="${avaliacao.id}" ${correcoesfinais[0].correcao_visivel eq 'true' ? 'checked' : ''}><b>Liberar notas</b>           
        </label>
            <a href="#" data-toggle="tooltip" data-placement="top" title="Marque essa opção somente quando todas as notas forem lançadas. (Nota final professor) !">
                <i class="fa fa-question-circle" aria-hidden="true"></i>
            </a>
    </div>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Aluno</th>
                    <th style="text-align:center;">Média das correções</th>
                    <th style="text-align:center;">Nota final do Professor</th>
                    <th>Seu feedback</th>
                    <th>Avaliar</th>
                </tr>
            </thead>    
            <c:choose>
                <c:when test="${!empty correcoesfinais}">
                    <c:forEach items="${correcoesfinais}" var="correcao">
                        <c:set var="mediaSystem" value="0"/>
                        <c:forEach items="${medias}" var="media">
                            <c:if test="${media.aluno.user.id eq correcao.aluno.user.id}">
                                <c:set var="mediaSystem" value="${media.nota}"/>
                            </c:if>
                        </c:forEach>
                        <tr>
                            <td> ${correcao.aluno.user.nome}</td>
                            <td  style="text-align:center;">
                                <fmt:formatNumber type="number"maxFractionDigits="2" value="${mediaSystem}"/>
                            </td>
                            <td  style="text-align:center;">
                                <b>
                                    <c:choose>
                                        <c:when test="${correcao.nota_final eq 0.0}">
                                            ${''}
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${correcao.nota_final}" />
                                        </c:otherwise>
                                    </c:choose>
                                </b>
                            </td>
                            <td>${correcao.feedback}</td>
                            <td>
                                <a href="#" class="btn btn-info open-Dialog" data-toggle="modal" data-target="#myModal" 
                                   data-nome="${correcao.aluno.user.nome}" data-mediasystem="${mediaSystem}" data-feedback="${correcao.feedback}"
                                   data-profnota="${correcao.nota_final eq 0.0 ? '' : correcao.nota_final}" data-idcorrecao="${correcao.id}"
                                   data-idaluno="${correcao.aluno.user.id}">
                                    <span class="fa fa-check" style="font-size: 25px;" title="Corrigir solução"></span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="5" align="center"><b>Nenhuma aluno matriculado no momento.</b></td></tr>
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
                <form method="POST" action="${pageContext.request.contextPath}/CorrecaoFinalController">
                    <input type="hidden" name="idCorrecaoFinal" id="idCorrecaoFinal">
                    <input type="hidden" name="idAluno" id="idAluno">
                    <div class="form-group ">
                        <label class="control-label " for="lblMedia"><b>Média das correções:</b> </label>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Média aritmética simples das correções efetuadas pelos alunos. Caso o valor seja 0, o aluno em questão não foi avaliado por nenhum outro aluno até o momento.">
                            <i class="fa fa-question-circle" aria-hidden="true"></i>
                        </a>
                        <input class="form-control" name="avgSystem" id="avgSystem" type="text" readonly/>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="lblPeso"><b>Peso da Média das Correções [0% - 100%] :</b> </label>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Peso da média das correções utilizado no cálculo da nota final.">
                            <i class="fa fa-question-circle" aria-hidden="true"></i>
                        </a>
                        <input class="form-control" name="peso" type="number" step="1" min="0" max="100" required>                
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="lblnotaProf"><b>Nota final do Professor:</b> </label>
                        <a href="#" data-toggle="tooltip" data-placement="top" class="htmlTooltip"
                           title=''>
                            <i class="fa fa-question-circle" aria-hidden="true"></i>
                        </a>
                        <input class="form-control" id="notaProf" name="notaProf" type="number" min="0" step="any" required/>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="lblFeedback"><b>Seu Feedback:</b></label>
                        <a href="#" data-toggle="tooltip" data-placement="top"
                           title='Comentário sobre o desempenho geral do aluno. Tanto no processo de submissões como de correções.'>
                            <i class="fa fa-question-circle" aria-hidden="true"></i>
                        </a>
                        <textarea class="form-control" cols="40" id="feedback" name="feedback" rows="5" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" class="btn btn-primary">Salvar alterações</button>
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
    var mediaSystem      = $(this).data('mediasystem');
    var feedback         = $(this).data('feedback');
    var notaProf         = $(this).data('profnota');
    var idcorrecao       = $(this).data('idcorrecao');
    var idaluno          = $(this).data('idaluno');
    
    $(".modal-body #avgSystem").val( mediaSystem  );
    $(".modal-body #feedback").val( feedback  );
    $(".modal-body #notaProf").val( notaProf  );
    $(".modal-body #idCorrecaoFinal").val( idcorrecao  );
    $(".modal-body #idAluno").val( idaluno  );
    $("#nomeAluno").html(nome);
});

$(document).ready(function() {
    $('#liberarNotas').change(function() {
        var idAvaliacao = $(this).val();
        var isCorrecaoVisible;
        if($(this).is(":checked")) {
            isCorrecaoVisible = 'true';
        }
        else{
            isCorrecaoVisible = 'false';
        }
        $.ajax({
            type: 'GET',
            url: 'AjaxController',
            data : {
                idAvaliacao: idAvaliacao,
                isCorrecaoVisible : isCorrecaoVisible
            },
            statusCode: {
                404: function() {
                    console.log('Pagina não encontrada');
                },
                500: function(){
                    console.log('Erro no servidor');
                }
            }
        }); 
    });
});
$( ".htmlTooltip" ).tooltip({
   content: "Fórmula utilizada:<br>((MC*P)+(NP*(100-P)))/100<br> MC = Média correções<br> P  = % inserida no campo Peso<br>NP = Nota inserida no campo abaixo"
});
</script>