<%-- 
    Document   : corrigirAvaliacao
    Created on : 02/10/2016, 00:37:37
    Author     : Kato
--%>
<%@include file="../../include/headerAluno.jsp" %>
<%@include file="../../include/sidebarLeftAluno.jsp" %>
<div class="col-md-9 col-lg-10 main">
    <h2>Corre��o - Avalia��o - Tarefa</h2>
    <hr>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
            <form method="post">
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Crit�rios:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10" disabled>
 0 - O estudante n�o submeteu solu��o alguma.
1  - O estudante resolveu de forma incompleta somente uma solu��o.
2 - O estudante resolveu de forma incompleta as duas solu��es.
3 - O estudante desenvolveu 2 solu��es, mas n�o atendeu aos requisitos adicionais.
4 - O estudante desenvolveu  2 solu��es e atendeu a todos os requisitos.
5 - O estudante resolveu os problemas de forma elegante.
                    </textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Resposta aluno (n):</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10" disabled>
*//recursivo
int factorial(int n)
{
  return (n == 1 || n == 0) ? 1 : factorial(n - 1) * n;
}
                    </textarea>
                </div>
                <div class="form-group ">
                    <label class="control-label " for="subject"><b>Seu coment�rio:</b></label>
                    <textarea class="form-control" cols="40" id="message" name="message" rows="10">
                    </textarea>
                </div>
                 <div class="form-group ">
                    <label class="control-label " for="subject"><b>Sua nota:</b></label>
                    <select class="form-control">
                        <option>0</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>
                <div class="form-group">
                    <div>
                        <button class="btn btn-primary " name="submit" type="submit">Submeter sua corre��o</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../../include/footerProfessor.jsp" %>

