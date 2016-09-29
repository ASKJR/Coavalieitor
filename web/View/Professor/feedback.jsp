<%-- 
    Document   : avaliacaoFinal
    Created on : 28/09/2016, 23:34:40
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2> Avaliar Estudantes </h2>
    <hr>
    <button class="btn btn-info"> Liberar notas </button>
    <button class="btn btn-danger" disabled> Bloquear notas </button>
    <hr>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-inverse">
                <tr>
                    <th>Estudante</th>
                    <th>Média do sistema</th>
                    <th>Média final Professor</th>
                    <th>Seu feedback</th>
                </tr>
            </thead>
            <tr>
                <td><a data-toggle="modal" href="#myModal">Alberto Sussumu Kato Junior</a></td>
                <td>7.7</td>
                <td>8.8</td>
                <td>Excelente trabalho Alberto. Continue assim.</td>
            </tr>
            <tr>
                <td>Ivonete Roque</td>
                <td>7.7</td>
                <td>8.8</td>
                <td>Excelente trabalho Ivonete. Continue assim.</td>
            </tr>
            
            <tr>
                <td>Welygton Del Pra</td>
                <td>7.7</td>
                <td>8.8</td>
                <td>
                    Excelente trabalho DelPra. Continue assim.
                    Excelente trabalho DelPra. Continue assim.
                    Excelente trabalho DelPra. Continue assim.
                    Excelente trabalho DelPra. Continue assim.
                </td>
            </tr>
        </table>
    </div>
<!-- Button trigger modal -->
<!--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>
</div>-->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Alberto Sussumu Kato Junior</h4>
            </div>
            <div class="modal-body">
                <form action="feedback.jsp" method="post">
                    <div class="form-group ">
                        <label class="control-label " for="name"><b>Média do sistema:</b> </label>
                        <input class="form-control" id="name" name="name" type="text" value="7.7" disabled/>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="name"><b>Peso da média do sistema no calculo da média final:</b> </label>
                        <select class="form-control" id="sel1">
                            <option>0%</option>
                            <option>10%</option>
                            <option>20%</option>
                            <option>50%</option>
                        </select>                    
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="name"><b>Média final Professor:</b> </label>
                        <input class="form-control" id="name" name="name" type="number"/>
                    </div>
                    <div class="form-group ">
                        <label class="control-label " for="subject"><b>FeedBack do Professor:</b></label>
                        <textarea class="form-control" cols="40" id="message" name="message" rows="5"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" class="btn btn-primary">Salvar alterações</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>



