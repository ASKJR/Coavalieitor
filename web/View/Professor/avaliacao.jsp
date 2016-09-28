<%-- 
    Document   : avaliacao
    Created on : 27/09/2016, 22:13:41
    Author     : Kato
--%>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Nova avaliação</h2>
    <hr>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
            <form method="post">
                <div class="form-group ">
                    <label class="control-label " for="name"><b>Nome da avaliação:</b> </label>
                    <input class="form-control" id="name" name="name" type="text"/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Descrição:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10"></textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Requisitos adicionais:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10"></textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="name"><b>Período de submissões:</b> </label>
                    <input class="form-control" id="daterange" name="daterange" type="text"/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="name"><b>Período de correções:</b> </label>
                    <input class="form-control" id="name" name="name" type="text"/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="name"><b>Número de correções por estudante:</b> </label>
                    <input class="form-control" id="name" name="name" type="text"/>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="name"><b>Nota máxima:</b> </label>
                    <input class="form-control" id="name" name="name" type="text"/>
                </div>
                 <div class="form-group ">
                    <label class="control-label " for="subject"><b>Critérios de correções:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10"></textarea>
                </div>
                <div class="form-group">
                    <div>
                        <button class="btn btn-primary " name="submit" type="submit">Criar Avaliação</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>
