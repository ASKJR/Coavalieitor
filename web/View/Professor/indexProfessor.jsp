<%-- 
    Document   : indexProfessor
    Created on : 21/09/2016, 22:26:19
    Author     : Kato
--%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/dash.css" type="text/css"/>
<%@include file="../../include/headerProfessor.jsp" %>
<%@include file="../../include/sidebarLeftProfessor.jsp" %>


<div class="col-md-9 col-lg-10 main">
    <br>
    <h2>Dashboard</h2>
    <hr>
    <div class="row">
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-blue panel-widget ">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked bag"><use xlink:href="#stroked-bag"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">120</div>
							<div class="text-muted">New Orders</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-orange panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked empty-message"><use xlink:href="#stroked-empty-message"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">52</div>
							<div class="text-muted">Comments</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-red panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked app-window-with-content"><use xlink:href="#stroked-app-window-with-content"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">${avaliacoes}</div>
							<div class="text-muted">Avalia��es Abertas</div>
						</div>
					</div>
				</div>
			</div>                          
			<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-teal panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
                                                    <svg class="glyph stroked clipboard with paper"><use xlink:href="#stroked-clipboard-with-paper"/></svg>
                                                </div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">${correcoes}</div>
							<div class="text-muted">Corre��es Abertas</div>
						</div>
					</div>
				</div>
			</div>                                                        
		</div><!--/.row-->
		<div class="row">
			<div class="col-lg-12">
			</div>
		</div><!--/.row-->                


                <div class="row">
                    <br/>
                </div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
                                    <div id="container3" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
				</div>
			</div>
		</div><!--/.row-->                
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="canvas-wrapper">
                                                    <ul class="list-group">
                                                        <li class="list-group-item active">Alunos Que Mais Corrijiram</li>
                                                        <c:forEach items="${listaTopCorretores}" var="topCorretor"> 
                                                            <li class="list-group-item">${topCorretor.nome} <b> ${topCorretor.qtdCorrecoes}</b></li>
                                                        </c:forEach>
                                                     </ul>
                                                </div>
					</div>
				</div>
                        </div>
                        			<div class="col-lg-6">

				<div class="panel panel-default">
					<div class="panel-body">
						<div class="canvas-wrapper">
                                                    <ul class="list-group">
                                                        <li class="list-group-item active">Menores Notas (�ltima Avalia��o)</li>
                                                        <c:forEach items="${listaMenoresNotas}" var="menorNota"> 
                                                            <li class="list-group-item">${menorNota.nome} <b> ${menorNota.nota}</b></li>
                                                        </c:forEach>
                                                     </ul>
                                                </div>
					</div>
				</div> 
                                                </div>
			</div>
		</div><!--/.row-->                                             	
</div>
 <script src="${pageContext.request.contextPath}/resource/js/dash_img.js" type="text/javascript" charset="utf-8"></script>
 	<script src="${pageContext.request.contextPath}/resource/js/chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/chart-data.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/easypiechart.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/easypiechart-data.js"></script>

<%@include file="../../include/footerProfessor.jsp" %>

<script type="text/javascript">
$(function () {
    var naoIniciadas = "<c:out value='${avalNaoIniciadas}'/>";
    var emAndamento = "<c:out value='${emAndamento}'/>";
    var finalizadas = "<c:out value='${finalizadas}'/>";
        
    $('#container3').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Avalia��es por Fase'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.y}</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Avalia��es',
            colorByPoint: true,
            data: [{
                name: 'N�o Iniciadas',
                y: <c:out value='${avalNaoIniciadas}'/>
            }, {
                name: 'Em Andamento',
                y: <c:out value='${avalEmAndamento}'/>,
                sliced: true,
                selected: true
            }, {
                name: 'Finalizadas',
                y: <c:out value='${avalFinalizadas}'/>  
            }]
        }]
    });
});
</script>