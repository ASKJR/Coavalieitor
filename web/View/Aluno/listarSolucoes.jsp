<%-- 
    Document   : listarCorrecoes
    Created on : 02/10/2016, 00:41:51
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Lista de soluções disponíveis para sua correção:</h2>
    <hr>
    <p>Avaliação: <b>${avaliacao.nome}</b></p>
    <p>Qtd. de correções exigidas pelo professor: <b>0/${avaliacao.num_correcao_estudante}</b></p>
    <hr>
    <button class="btn btn-info" onclick="window.history.back()">Voltar</button>
    <hr>
    <%@include file="../../include/mensagem.jsp" %>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Seq.</th>
                    <th>Solução</th>
                    <th style="text-align: center;">Corrigir</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty solucoes}">
                    <c:forEach items="${solucoes}" var="solucao">
                        <tr>
                            <td>000${solucao.id}</td>
                            <td>Solução__000${solucao.id}</td>
                            <td style="text-align: center;">
                                <a class="btn btn-secondary btn-xs" href="${pageContext.request.contextPath}/CorrecaoControllerAluno?action=insert&idAvaliacao=${avaliacao.id}&idSolucao=${solucao.id}">
                                    <span class="fa fa-check" style="font-size: 25px;" title="Corrigir solução"></span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="3" align="center"><b>Nenhuma solucão disponível no momento...</b></td></tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>

<%@include file="../../include/footerProfessor.jsp" %>
