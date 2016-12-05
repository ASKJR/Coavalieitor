<%-- 
    Document   : relatorios
    Created on : 29/09/2016, 22:27:27
    Author     : Kato
--%>

<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Relatórios</h2>
    <hr>
   <form class="form-horizontal" method="GET" action="${pageContext.request.contextPath}/GerarPDFController">
        <fieldset>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" for="nomeTipoRelatorio"><b>Tipo de relatório:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectTipoRelatorio" id="selectTipoRelatorio">
                    <option value="alunosByMedia">Alunos ordenados por média</option>
                    <option value="alunosByCorrecoes">Alunos que mais efetuaram correções</option>
                    <option value="alunosByTurma">Alunos agrupados por turmas</option>
                </select>
            </div>
        </div><br><br>
        
        <h3>Filtros</h3>
        <hr>     
        
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-3 control-label" id="periodoRelatorio" for="periodoRelatorio"><b>Período:</b></label>  
            <div class="col-md-6">
                <input class="form-control daterange" id="periodoRelatorio" name="periodoRelatorio" type="text" />
            </div>
        </div><br><br><br>
        <!--<input type="hidden" name="getPDF" value="relatorioProfessor">-->
        
        <input type="hidden" name="getPDF" value="relatorioProfessor">

        <input type="hidden" name="action" value="listarTurmasPorProfessor">
        <fieldset>
        <div class="form-group">
            <label class="col-md-3 control-label" id="labelInstituicao" for="labelInstituicao"><b>Nome da instituição:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectInstituicao" id="selectInstituicao">
                    <option value="0"></option>
                    <c:forEach items="${instituicoes}" var="instituicao"> 
                        <option value="${instituicao.id}">${instituicao.nome}</option>
                    </c:forEach>
                </select>
            </div>
        </div><br><br>       
        
        <div class="form-group">
            <label class="col-md-3 control-label" id="labelCurso" for="labelCurso"><b>Nome do curso:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectCurso" id="selectCurso">
                    <option></option>
                </select>
            </div>
        </div><br><br>
        
        <div class="form-group">
            <label class="col-md-3 control-label" id="labelDisciplina" for="labelDisciplina"><b>Nome da disciplina:</b></label>  
            <div class="col-md-6">
                <select class="form-control" name="selectDisciplina" id="selectDisciplina">
                    <option></option>
                </select>
            </div>
        </div><br><br>
   
        <div class="form-group">
                <label class="col-md-3 control-label" for=""></label>
                <div class="col-md-6">
                    <button id="" name="" class="btn btn-primary">Gerar relatório</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>
<%@include file="../../include/footerProfessor.jsp" %>
<script>
$(document).ready(function() {

    $('#selectTipoRelatorio').change(function(event) {
         function removerselects(){
            $('#selectCurso').hide();
            $('#selectDisciplina').hide();
            $('#selectInstituicao').hide();
            $('#labelCurso').hide();
            $('#labelDisciplina').hide();
            $('#labelInstituicao').hide(); 
        }

        function adicionarselects(){
            $('#selectCurso').show();
            $('#selectDisciplina').show();
            $('#selectInstituicao').show();
            $('#labelCurso').show();
            $('#labelDisciplina').show();
            $('#labelInstituicao').show(); 
        }  
        if($('#selectTipoRelatorio').val() == ('alunosByCorrecoes')) {
           removerselects();
        }
        else
            adicionarselects();
    });
    
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
