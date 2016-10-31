<%-- 
    Document   : avaliacoesTurma
    Created on : 01/10/2016, 22:25:20
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>${turma.nome} - Avaliações:</h2>
    <hr>
    <br>
    <%@include file="../../include/mensagem.jsp" %>
    <h3>Submeter soluções:</h3>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Avaliação</th>
                    <th style="text-align: center;">Resolver até:</th>
                    <th style="text-align: center;">Resolvido em:</th>
                    <th style="text-align: center;">Opção</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty avaliacoesSubmissao}">
                    <c:forEach items="${avaliacoesSubmissao}" var="avaliacao">
                        <tr>
                            <td><a href="#" data-toggle="tooltip" title="${avaliacao.descricao}">${avaliacao.nome}</a></td>
                            <td style="text-align: center;"><a href="#" data-toggle="tooltip" title="${avaliacao.SF}">  <span class="fa fa-clock-o glyphicon glyphicon-time" style="color: black; font-size: 25px;"></span></a></td>
                                <c:forEach items="${solucoesAluno}" var="solucao">
                                    <c:if test="${avaliacao.id eq solucao.avaliacao.id}">
                                       <c:set var="found" value="true"/>
                                       <c:set var="submetidoEm" value="${solucao.SD}"/>
                                    </c:if>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${found eq 'true'}">
                                        <td style="text-align: center;">${submetidoEm}</td>
                                        <td style="text-align: center;">
                                            <button class="btn btn-success">Submetido</button>
                                        </td>
                                        <c:set var="found" value="false"/>
                                    </c:when>
                                    <c:otherwise>
                                        <td style="text-align: center;"></td>
                                        <td style="text-align: center;">
                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/SolucaoControllerAluno?action=insert&idAvaliacao=${avaliacao.id}">Resolver</a>
                                        </td>
                                    </c:otherwise>
                                </c:choose>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <td style="text-align: center;" colspan="4">Nenhuma avaliacão no período de submissões disponível no momento...</td>                            
                </c:otherwise>
            </c:choose>
        </table>
    </div>
    <br><br><br><br>
    <h3>Corrigir soluções:</h3>
    <hr>
   <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Avaliação</th>
                    <th style="text-align: center;">Corrigir até:</th>
                    <th style="text-align: center;">Corrigido em:</th>
                    <th style="text-align: center;">Opção</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty avaliacoesCorrecao}">
                    <c:forEach items="${avaliacoesCorrecao}" var="avaliacao">
                        <tr>
                            <td><a href="#" data-toggle="tooltip" title="${avaliacao.descricao}">${avaliacao.nome}</a></td>
                            <td style="text-align: center;"><a href="#" data-toggle="tooltip" title="${avaliacao.CF}">  <span class="fa fa-clock-o glyphicon glyphicon-time" style="color: black; font-size: 25px;"></span></a></td>
                            <td style="text-align: center;"></td>
                            <td style="text-align: center;"><a class="btn btn-warning" href="${pageContext.request.contextPath}/SolucaoControllerAluno?action=listarSolucoes&idAvaliacao=${avaliacao.id}">Corrigir</a></td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <td style="text-align: center;" colspan="4">Nenhuma avaliacão no período de correções disponível no momento...</td>                            
                </c:otherwise>
            </c:choose>
        </table>
    </div>
    <br><br><br><br>
    <h3>Pontuação e comentários do Professor:</h3>
    <hr>
   <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Avaliação</th>
                    <th>Nota Prof.</th>
                    <th>FeedBack Prof.</th>
                    
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty avaliacoesEncerrado}">
                    <c:forEach items="${avaliacoesEncerrado}" var="avaliacao">
                        <tr>
                            <td><a href="#" data-toggle="tooltip" title="${avaliacao.descricao}">${avaliacao.nome}</a></td>
                            <td></td>
                            <td></td>
                        <tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <td style="text-align: center;" colspan="4">Nenhuma avaliacão na fila para correção do professor...</td>                            
                </c:otherwise>
            </c:choose>    
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>


