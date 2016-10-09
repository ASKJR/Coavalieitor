<%-- 
    Document   : addDisciplina
    Created on : 08/10/2016, 12:14:51
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Nova disciplina:</h2>
    <hr>
    <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/DisciplinaController">
        <input type="hidden" name="action" value="inserir">
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
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeDisciplina"><b>Nome da disciplina:</b></label>  
            <div class="col-md-6">
                <input id="textinput" name="nomeDisciplina" type="text" placeholder="Digite o nome da disciplina" class="form-control input-md" required>
            </div>
        </div><br><br>
        <!-- Button -->
        <div class="form-group">
            <label class="col-md-3 control-label" for=""></label>
            <div class="col-md-6">
                <button id="" name="" class="btn btn-primary">Salvar</button>
            </div>
        </div>
        </fieldset>
    </form>
    <hr>
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
                    $('#selectCurso').append('<option>Instituição sem nenhum curso.</option>');
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
