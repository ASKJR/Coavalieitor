<%-- 
    Document   : turmaAvaliacoes
    Created on : 27/09/2016, 21:50:50
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>${turma.nome} - Avaliações</h2>
    <hr>
    <a href="${pageContext.request.contextPath}/AvaliacaoController?action=inserir&idTurma=${turma.id}" class="btn btn-success">+ Adicionar</a>
    <hr>
    <br>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Avaliação</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty avaliacoes}">
                    <c:forEach items="${avaliacoes}" var="avaliacao">
                        <tr>
                            <td>${avaliacao.nome}</td>
                            <td>
                                <a class="btn btn-info" href="${pageContext.request.contextPath}/AvaliacaoController?action=edit&idInstituicao=${instituicao.id}&idCurso=${disciplina.curso.id}&idDisciplina=${turma.disciplina.id}&idTurma=${turma.id}&idAvaliacao=${avaliacao.id}">Editar</a>&nbsp
                                <a class="btn btn-danger">Deletar</a>&nbsp
                                <a class="btn btn-success" href="View/Professor/listarSubmissoes.jsp">Listar submissões</a>&nbsp
                                <a class="btn btn-primary" href="View/Professor/listarCorrecoes.jsp">Listar correções</a>&nbsp
                                <a class="btn btn-warning" href="View/Professor/feedback.jsp">Avaliar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="3" align="center"><b>Nenhum avaliação disponível no momento...</b></td></tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>

