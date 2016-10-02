<%-- 
    Document   : resolverAvaliacao
    Created on : 01/10/2016, 22:57:56
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Resolver avaliação - Caixeiro viajante</h2>
    <hr>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
            <form method="post">
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Problema:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10" disabled>
 O problema do caixeiro-viajante consiste na procura de um circuito que possua a menor distância, começando numa cidade qualquer, entre várias, visitando cada cidade precisamente uma vez e regressando à cidade inicial (Nilsson, 1982).
                    </textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b></b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10" disabled>
*Todas a soluções devem ser submetidas na linguagem C ANSI.
                    </textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Sua resposta:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10">
                    </textarea>
                </div>
                <div class="form-group">
                    <div>
                        <button class="btn btn-primary " name="submit" type="submit">Submeter sua resposta</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../include/footerAluno.jsp" %>

