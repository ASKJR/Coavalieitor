<%-- 
    Document   : listarAlunosTurma
    Created on : 02/10/2016, 21:23:54
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Alunos da turma "tal" :</h2>
    <hr>
    <form class="form-horizontal">
        <fieldset>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinputNome"><b>Incluir aluno manualmente:</b></label>  
                <div class="col-md-6">
                    <input id="autocomplete" name="search" type="text" class="form-control input-md" required>
                    <input id="idAluno" name="idAluno" type="hidden">
                </div>
            </div><br><br>

            <div class="form-group">
                <label class="col-md-3 control-label" for=""></label>
                <div class="col-md-6">
                    <button id="" name="" class="btn btn-primary">Incluir</button>
                </div>
            </div>
        </fieldset>
    </form>
    <hr><br>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Opções</th>
                </tr>
            </thead>
            <tr>
                
                <td>Alberto Sussumu Kato Junior</td>
                <td>albertokatojr@gmail.com</td> 
                <td> 
                    <button id="" name="" class="btn btn-danger">Remover</button>
                    &nbsp
                </td>
            <tr>
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