<%-- 
    Document   : disciplina
    Created on : 27/09/2016, 00:39:20
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Disciplinas</h2>
    <hr>
    <a href="${pageContext.request.contextPath}/DisciplinaController?action=inserir" class="btn btn-success">+ Adicionar</a>
    <hr>
    <form class="form-horizontal" method="GET" action="${pageContext.request.contextPath}/DisciplinaController">
        <input type="hidden" name="action" value="listarDisciplinaPorCurso">
        <fieldset>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeInstituicao"><b>Nome da instituição:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectInstituicao" id="selectInstituicao" required>
                    <option></option>
                    <c:forEach items="${instituicoes}" var="instituicao"> 
                        <option value="${instituicao.id}">${instituicao.nome}</option>
                    </c:forEach>
                </select>
            </div>
        </div><br><br>
        
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeCurso"><b>Nome do curso:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectCurso" id="selectCurso">
                    <option></option>
                </select>
            </div>
        </div><br><br>
        <!-- Button -->
        <div class="form-group">
            <label class="col-md-3 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Listar disciplinas</button>
            </div>
        </div>
        </fieldset>
    </form>
    <hr>
    <br>
    <c:if test="${!empty instituicao.nome}">
        <p><b>${instituicao.nome} >  ${curso.nome} :</b></p>
    </c:if>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>#ID</th>
                    <th>Nome</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <c:choose>
                <c:when test="${!empty disciplinas}">
                    <c:forEach items="${disciplinas}" var="disciplina">
                        <tr>
                            <td>${disciplina.id}</td>
                            <td>${disciplina.nome}</td>
                            <td>
                                <a class="btn btn-info" href="${pageContext.request.contextPath}/DisciplinaController?action=edit&idDisciplina=${disciplina.id}&idCurso=${disciplina.curso.id}&idInstituicao=${idInstituicao}">Editar</a>&nbsp
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/DisciplinaController?action=delete&idDisciplina=${disciplina.id}&idCurso=${disciplina.curso.id}&idInstituicao=${idInstituicao}">Deletar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="3" align="center"><b>Nenhum registro encontrado, ou o botão listar disciplinas não foi pressionado.</b></td></tr>
                </c:otherwise>
            </c:choose>    
        </table>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>
<script>
$(document).ready(function() {

    $('#selectInstituicao').change(function(event) {
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
    });
});
</script>