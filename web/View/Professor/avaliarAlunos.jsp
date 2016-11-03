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
    <button class="btn btn-info"> Liberar notas </button>
    <button class="btn btn-danger" disabled> Bloquear notas </button>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Aluno</th>
                    <th style="text-align:center;">Média do sistema</th>
                    <th style="text-align:center;">Média final Professor</th>
                    <th>Seu feedback</th>
                    <th>Avaliar</th>
                </tr>
            </thead>    
            <c:choose>
                <c:when test="${!empty correcoesfinais}">
                    <c:forEach items="${correcoesfinais}" var="correcao">
                        <c:forEach items="${medias}" var="media">
                            <c:if test="${media.aluno.user.id eq correcao.aluno.user.id}">
                                <c:set var="mediaSystem" value="${media.nota}"/>
                            </c:if>
                        </c:forEach>
                        <tr>
                            <td> ${correcao.aluno.user.nome}</td>
                            <td  style="text-align:center;">${mediaSystem}</td>
                            <td  style="text-align:center;"><b>${correcao.nota_final eq 0.0 ? '' : correcao.nota_final}</b></td>
                            <td>${correcao.feedback}</td>
                            <td>
                                <a href="#" class="btn btn-info open-Dialog" data-toggle="modal" data-target="#myModal" 
                                   data-nome="${correcao.aluno.user.nome}" data-mediasystem="${mediaSystem}" data-feedback="${correcao.feedback}"
                                   data-profnota="${correcao.nota_final eq 0.0 ? '' : correcao.nota_final}" data-idcorrecao="${correcao.id}">
                                    <span class="fa fa-check" style="font-size: 25px;" title="Corrigir solução"></span>
                                </a>
                            </td>
                        </tr>
                        <c:set var="mediaSystem" value=""/>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="5" align="center"><b>Nenhuma aluno matriculado no momento.</b></td></tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
<!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>
</div>-->
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
                <form action="feedback.jsp" method="post">
                    <input type="hidden" name="idCorrecaoFinal" id="idCorrecaoFinal">
                    <div class="form-group ">
                        <label class="control-label " for="name"><b>Média do sistema:</b> </label>
                        <input class="form-control" name="avgSystem" id="avgSystem" type="text" disabled/>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="name"><b>Peso da média do sistema no calculo da média final: (0-100)%</b> </label>
                        <input class="form-control" type="number" step="1" min="0" max="100" required>                
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="name"><b>Média final Professor:</b> </label>
                        <input class="form-control" id="notaProf" name="notaProf" type="number"/>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="subject"><b>FeedBack do Professor:</b></label>
                        <textarea class="form-control" cols="40" id="feedback" name="feedback" rows="5"></textarea>
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
    $(".modal-body #avgSystem").val( mediaSystem  );
    $(".modal-body #feedback").val( feedback  );
    $(".modal-body #notaProf").val( notaProf  );
    $(".modal-body #idCorrecaoFinal").val( idcorrecao  );
    $("#nomeAluno").html(nome);
});
</script>