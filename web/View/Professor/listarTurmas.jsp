<%-- 
    Document   : turma
    Created on : 27/09/2016, 20:10:36
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Turmas</h2>
    <hr>
    <a href="${pageContext.request.contextPath}/TurmaController?action=inserir" class="btn btn-success"> + Adicionar </a><br>
    <hr>
    <%@include file="../../include/mensagem.jsp" %>
    <form class="form-horizontal" method="GET" action="${pageContext.request.contextPath}/TurmaController">
        <input type="hidden" name="action" value="listarTurmasPorProfessor">
        <fieldset>
        <div class="form-group">
            <label class="col-md-3 control-label" for="labelInstituicao"><b>Nome da instituição:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectInstituicao" id="selectInstituicao" required>
                    <option value="0"></option>
                    <c:forEach items="${instituicoes}" var="instituicao"> 
                        <option value="${instituicao.id}">${instituicao.nome}</option>
                    </c:forEach>
                </select>
            </div>
        </div><br><br>
        
        <div class="form-group">
            <label class="col-md-3 control-label" for="labelCurso"><b>Nome do curso:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectCurso" id="selectCurso" required>
                    <option></option>
                </select>
            </div>
        </div><br><br>
        
        <div class="form-group">
            <label class="col-md-3 control-label" for="labelDisciplina"><b>Nome da disciplina:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectDisciplina" id="selectDisciplina" required>
                    <option></option>
                </select>
            </div>
        </div><br><br>
        
        <div class="form-group">
            <label class="col-md-3 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Listar turmas</button>
            </div>
        </div>
        </fieldset>
    </form>
    <hr>
    <br>
    <c:if test="${!empty disciplina.nome}">
        <p><b>${instituicao.nome} >  ${curso.nome} > ${disciplina.nome}:</b></p>
    </c:if>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Turma</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty turmas}">
                    <c:forEach items="${turmas}" var="turma">
                        <tr>
                            <td>${turma.nome}</td>
                            <td>
                                <a class="btn btn-info" href="${pageContext.request.contextPath}/TurmaController?action=edit&idInstituicao=${instituicao.id}&idCurso=${disciplina.curso.id}&idDisciplina=${turma.disciplina.id}&idTurma=${turma.id}">Editar</a>&nbsp
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/TurmaController?action=delete&idInstituicao=${instituicao.id}&idCurso=${disciplina.curso.id}&idDisciplina=${turma.disciplina.id}&idTurma=${turma.id}" 
                                   onclick="return confirm('Tem certeza que deseja excluir essa turma?\nTodas informações serão perdidas, incluindo submissões, correções etc!')">Deletar</a>
                                <a href="${pageContext.request.contextPath}/MatriculaController?action=listarAlunosTurma&idInstituicao=${instituicao.id}&idCurso=${disciplina.curso.id}&idDisciplina=${turma.disciplina.id}&idTurma=${turma.id}" class="btn btn-success">Alunos</a>
                                <a href="${pageContext.request.contextPath}/AvaliacaoController?action=listarAvaliacoesPorTurma&idInstituicao=${instituicao.id}&idCurso=${disciplina.curso.id}&idDisciplina=${turma.disciplina.id}&idTurma=${turma.id}" class="btn btn-warning">Avaliações</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="2" align="center"><b>Nenhum registro encontrado, ou o botão listar turmas não foi pressionado.</b></td></tr>
                </c:otherwise>
            </c:choose> 
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>
<script>
$(document).ready(function() {

    $('#selectInstituicao').change(function(event) {
        if($('#selectInstituicao').val()==='0'){
            $('#selectCurso option').remove();
            $('#selectDisciplina option').remove();
        }
        else{
            $.ajax({
               type: 'GET',
               url: 'AjaxController',
               data: 'instituicaoId='+$('#selectInstituicao').val(),
               statusCode: {
                   404: function() {
                       console.log('Pagina não encontrada');
                   },
                   500: function(){
                       console.log('Erro no servidor');
                   }
               },
               success: function(dados){
                   pegadados = dados.split(":");
                   limparselect();
                   if(dados === '')
                       $('#selectCurso').append("<option value='0'>Instituição sem nenhum curso.</option>");
                   else{
                       $('#selectCurso').append('<option></option>');
                       for(var i = 0; i < pegadados.length - 1; i++){
                           var codigoCurso = pegadados[i].split("-")[0]; 
                           var nomeCurso = pegadados[i].split("-")[1];
                           $('#selectCurso').append('<option value ="'+codigoCurso+'">'+nomeCurso+'</option>');

                       }
                   }
               }
           }); 
           function limparselect(){
               $('#selectCurso option').remove();
           }
        }
    });
    $('#selectCurso').change(function(event) {
         $.ajax({
            type: 'GET',
            url: 'AjaxController',
            data: 'cursoId='+$('#selectCurso').val(),
            statusCode: {
                404: function() {
                    console.log('Pagina não encontrada');
                },
                500: function(){
                    console.log('Erro no servidor');
                }
            },
            success: function(dados){
                pegadados = dados.split(":");
                limparselect();
                if(dados === '')
                    $('#selectDisciplina').append("<option value='0'>Curso sem nenhuma disciplina.</option>");
                else{
                    $('#selectDisciplina').append("<option></option>");
                    for(var i = 0; i < pegadados.length - 1; i++){
                        var codigoDisciplina = pegadados[i].split("-")[0]; 
                        var nomeDisciplina = pegadados[i].split("-")[1];
                        $('#selectDisciplina').append('<option value ="'+codigoDisciplina+'">'+nomeDisciplina+'</option>');

                    }
                }
            }
        }); 
        function limparselect(){
            $('#selectDisciplina option').remove();
        }
    });
});
</script>
