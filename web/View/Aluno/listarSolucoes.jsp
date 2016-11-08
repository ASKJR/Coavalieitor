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
    <p>Qtd. de correções exigidas pelo professor: <b>${numCorrecoesRealizadas}/${avaliacao.num_correcao_estudante}</b></p>
    <hr>
    <a href="${pageContext.request.contextPath}/AvaliacaoControllerAluno?action=listarAvaliacoesPorTurma&selectTurma=${sessionScope.idTurma}" class="btn btn-info">Voltar</a>
    <hr>
    <%@include file="../../include/mensagem.jsp" %>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Solução</th>
                    <th style="text-align: center;">Corrigir</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${empty solucoes || numCorrecoesRealizadas eq avaliacao.num_correcao_estudante}">
                    <tr><td colspan="3" align="center"><b>Nenhuma solucão disponível para correção, ou você já corrigiu a quantidade de correções exigidas pelo professor.</b></td></tr>                    
                </c:when>
                <c:otherwise>
                    <c:forEach items="${solucoes}" var="solucao">
                        <c:forEach items="${correcoes}" var="correcao">
                            <c:if test="${solucao.id eq correcao.solucao.id}">
                                <c:set var="found" value="true"/>
                            </c:if>
                        </c:forEach>
                        <tr>
                            <td><b>Solução__Aluno__${solucao}</b></td>
                            <c:choose>
                                <c:when test="${found eq 'true'}">
                                    <td style="text-align: center;">
                                        <button class="btn btn-success">Corrigido</button>
                                    </td>
                                    <c:set var="found" value="false"/>
                                </c:when>
                            <c:otherwise>
                                <td style="text-align: center;">
                                    <a class="btn btn-secondary btn-xs" href="${pageContext.request.contextPath}/CorrecaoControllerAluno?action=insert&idAvaliacao=${avaliacao.id}&idSolucao=${solucao.id}">
                                        <span class="fa fa-check" style="font-size: 25px;" title="Corrigir solução"></span>
                                    </a>
                                </td>
                            </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>

<%@include file="../../include/footerProfessor.jsp" %>
