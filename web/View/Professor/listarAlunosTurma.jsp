<%-- 
    Document   : listarAlunosTurma
    Created on : 02/10/2016, 21:23:54
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Alunos da turma: ${turma.nome}</h2>
    <hr>
        <a href="${pageContext.request.contextPath}/TurmaController?action=listarTurmasPorProfessor&selectInstituicao=${sessionScope.idInstituicao}&selectCurso=${sessionScope.idCurso}&selectDisciplina=${sessionScope.idDisciplina}" class="btn btn-info"> Voltar </a><br>  
    <hr>    
    <%@include file="../../include/mensagem.jsp" %>
    <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/MatriculaController">
        <fieldset>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinputNome"><b>Incluir aluno manualmente:</b></label>  
                <div class="col-md-6">
                    <input id="autocomplete" name="nomeAluno" type="text" class="form-control input-md" required>
                    <input id="idAluno" name="idAluno" type="hidden">
                    <input id="idTurma" name="idTurma" value="${turma.id}"type="hidden">
                </div>
            </div><br><br>

            <div class="form-group">
                <label class="col-md-3 control-label" for=""></label>
                <div class="col-md-6">
                    <button id="" name="" class="btn btn-primary">Incluir aluno</button>
                </div>
            </div>
        </fieldset>
    </form>
    <hr>
    <br>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Aluno</th>
                    <th>E-mail</th>
                    <th>Opções</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty matriculas}">
                    <c:forEach items="${matriculas}" var="matricula">
                        <tr>
                            <td>${matricula.aluno.user.nome}</td>
                            <td>${matricula.aluno.user.email}</td>
                            <td>
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/MatriculaController?action=delete&idTurma=${turma.id}&idAluno=${matricula.aluno.user.id}" 
                                   onclick="return confirm('Tem certeza que deseja remover esse aluno?')">Remover</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="3" align="center"><b>Nenhum aluno matriculado nessa turma até o momento...</b></td></tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
    
</div>
<%@include file="../../include/footerProfessor.jsp" %>
<script>
    $(document).ready(function() {
        $(function() {
            $("#autocomplete").autocomplete({
                minLength: 3,
                source : function(request, response) {
                    $.ajax({
                        url  : 'AjaxController',
                        type : 'GET',
                        data : {
                            autocomplete: true,
                            term : request.term
                        },
                        dataType : 'json',
                        statusCode: {
                            404: function() {
                                console.log('Pagina não encontrada');
                            },
                            500: function(){
                                console.log('Erro no servidor');
                            }
                        },
                        success : function(data) {
                                response(data);
                        }
                    });
                },
                select: function(event, ui) {
                    $('#idAluno').val(ui.item.id);
                }
            });
        });
    });
</script>