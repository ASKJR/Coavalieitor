<%-- 
    Document   : listarTurmas
    Created on : 01/10/2016, 21:14:14
    Author     : Kato
--%>

<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Turmas disponíveis:</h2>
    <hr>
    <%@include file="../../include/mensagem.jsp" %>
    <br>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Professor</th>
                    <th>Instituição / Curso / Disciplina/ Turma</th>
                    <th>Opções</th>
                    
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty turmas}">
                    <c:forEach items="${turmas}" var="turma">
                        <tr>
                            <td>${turma.professor.user.nome}</td>
                            <td>
                                ${turma.disciplina.curso.instituicao.nome} /
                                ${turma.disciplina.curso.nome} /
                                ${turma.disciplina.nome} /
                                ${turma.nome}
                            </td>
                            <td>
                                <c:forEach items="${matriculasAluno}" var="matricula">
                                   <c:if test="${matricula.turma.id eq turma.id}">
                                       <c:set var="found" value="true"/>
                                   </c:if>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${found eq 'true'}">
                                        <button class="btn btn-primary">Inscrito</button>
                                        <c:set var="found" value="false"/>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-success open-Dialog"  data-toggle="modal" data-target="#myModal" data-id="${turma.id}">Inscreva-me</button>  
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="3" align="center"><b>Nenhuma turma disponível no momento...</b></td></tr>
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
                <h4 class="modal-title" id="myModalLabel">Inscreva-se</h4>
            </div>
            <div class="modal-body">
                <form  method="POST" id="form-matricula" action="${pageContext.request.contextPath}/TurmaControllerAluno">
                    <div class="form-group ">
                        <label class="control-label " for="name"><b>Senha:</b> </label>
                        <input class="form-control" id="palavraChave" name="palavraChave" type="password" required/>
                        <input type="hidden" name="idTurma" id="idTurma" value=""/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" class="btn btn-primary">Entrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<%@include file="../../include/footerAluno.jsp" %>
<script>
$(document).on("click", ".open-Dialog", function () {
     var idTurma = $(this).data('id');
     $(".modal-body #idTurma").val( idTurma );
});
</script>
