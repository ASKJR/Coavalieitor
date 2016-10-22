<%-- 
    Document   : turmaAvaliacoes
    Created on : 27/09/2016, 21:50:50
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>${turma.nome} - Avalia��es</h2>
    <hr>
    <a href="${pageContext.request.contextPath}/TurmaController?action=listarTurmasPorProfessor&selectInstituicao=${sessionScope.idInstituicao}&selectCurso=${sessionScope.idCurso}&selectDisciplina=${sessionScope.idDisciplina}" class="btn btn-info">Voltar</a>
    <a href="${pageContext.request.contextPath}/AvaliacaoController?action=inserir&idTurma=${turma.id}" class="btn btn-success">+ Adicionar</a>
    <hr>
    <br>
    <%@include file="../../include/mensagem.jsp" %>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Avalia��o</th>
                    <th>A��es</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty avaliacoes}">
                    <c:forEach items="${avaliacoes}" var="avaliacao">
                        <tr>
                            <td><a href="#" data-toggle="tooltip" title="${avaliacao.descricao}">${avaliacao.nome} </a></td>
                            <td>
                                <a class="btn btn-info" href="${pageContext.request.contextPath}/AvaliacaoController?action=edit&&idTurma=${turma.id}&idAvaliacao=${avaliacao.id}">Editar</a>&nbsp
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/AvaliacaoController?action=delete&idTurma=${turma.id}&idAvaliacao=${avaliacao.id}"
                                     onclick="return confirm('Tem certeza que deseja excluir essa avalia��o?')">Deletar</a>&nbsp
                                <a class="btn btn-success" href="View/Professor/listarSubmissoes.jsp">Listar submiss�es</a>&nbsp
                                <a class="btn btn-primary" href="View/Professor/listarCorrecoes.jsp">Listar corre��es</a>&nbsp
                                <a class="btn btn-warning" href="View/Professor/feedback.jsp">Avaliar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="3" align="center"><b>Nenhum avalia��o dispon�vel no momento...</b></td></tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>

