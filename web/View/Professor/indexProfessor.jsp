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
			<div class="col-lg-6">
				<div class="panel panel-default">
                                    <div id="container1" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="panel panel-default">
                                    <div id="container2" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
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
                <br/>
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
        
    $('#container1').highcharts({
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
$(function () {
    $('#container2').highcharts({
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: 'Quantidade de Avalia��es x Corre��es / M�s'
        },        
        xAxis: [{
            categories: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
                'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
            crosshair: true
        }],
        yAxis: [{ // Primary yAxis
            labels: {
                format: '{value}',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            },
            title: {
                text: 'Corre��es',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        }, { // Secondary yAxis
            title: {
                text: 'Avali��es',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            labels: {
                format: '{value}',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            opposite: true
        }],
        tooltip: {
            shared: true
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            x: 120,
            verticalAlign: 'top',
            y: 100,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
        },
        series: [{
            name: 'Avalia��es',
            type: 'column',
            yAxis: 1,
            data: [<c:out value='${avalFinalizadas}'/>3, 5, 6, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
            tooltip: {
                valueSuffix: ' '
            }

        }, {
            name: 'Corre��es',
            type: 'spline',
            data: [70, 120, 95, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
            tooltip: {
                valueSuffix: '�C'
            }
        }]
    });
});
</script>