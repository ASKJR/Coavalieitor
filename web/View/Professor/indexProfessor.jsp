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
				<div class="panel panel-red panel-widget">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked app-window-with-content"><use xlink:href="#stroked-app-window-with-content"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">${avaliacoes}</div>
							<div class="text-muted">Avaliações Abertas</div>
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
							<div class="text-muted">Correções Abertas</div>
						</div>
					</div>
				</div>
			</div> 
<div class="col-xs-12 col-md-6 col-lg-3">
				<div class="panel panel-blue panel-widget ">
					<div class="row no-padding">
						<div class="col-sm-3 col-lg-5 widget-left">
							<svg class="glyph stroked bag"><use xlink:href="#stroked-bag"></use></svg>
						</div>
						<div class="col-sm-9 col-lg-7 widget-right">
							<div class="large">${correcoes}</div>
							<div class="text-muted">Alunos Abaixo da Média (70%)</div>
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
							<div class="large">${correcoes}</div>
							<div class="text-muted">Feedbacks Pendentes</div>
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
                                            <div id="container3" style="min-width: 310px; height: 400px; max-width: 900px; margin: 0 auto"></div>
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
                                                        <li class="list-group-item active">Alunos Que Mais Fizeram Correções</li>
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
                                                        <li class="list-group-item active">Menores Notas (Última Avaliação)</li>
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
                <c:forEach items="${listaMediaMes}" var="itemMedia">
                        <c:out value="${itemAval.media}, "/>
                  </c:forEach>
                <c:forEach items="${listaMediaMes}" var="itemMedia">
                        <c:out value="${itemAval.turma}, "/>
                  </c:forEach>
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
        credits: {
            enabled: false
        },        
        title: {
            text: 'Avaliações por Fase'
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
            name: 'Avaliações',
            colorByPoint: true,
            data: [{
                name: 'Não Iniciadas',
                y: <c:out value='${avalNaoIniciadas}'/>
            }, {
                name: 'Em Submissão',
                y: <c:out value='${avalEmSubmissao}'/>,
            }, {
                name: 'Em Correção',
                y: <c:out value='${avalEmCorrecao}'/>,
                sliced: true,
                selected: true
            },                    {
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
            text: 'Quantidade de Avaliações x Correções / Mês'
        },        
        xAxis: [{
            categories: [<c:forEach items="${listaAvaliacoesMes}" var="itemAval">
                            <c:out value="${itemAval.mes}, "/>
                        </c:forEach>],
            crosshair: true,
            title: {
                enabled: true,
                text: "Mês",
                style: {
                    fontWeight: 'normal'
                }
            }            
        }],
        yAxis: [{ // Primary yAxis
            labels: {
                format: '{value}',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            },
            title: {
                text: 'Correções',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        }, { // Secondary yAxis
            title: {
                text: 'Avalições',
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
            name: 'Avaliações',
            type: 'column',
            yAxis: 1,
            data: [<c:forEach items="${listaAvaliacoesMes}" var="itemAval">
                        <c:out value="${itemAval.qtdAvaliacoes}, "/>
                   </c:forEach>],
            tooltip: {
                valueSuffix: ' '
            }

        }, {
            name: 'Correções',
            type: 'spline',
            data: [<c:forEach items="${listaCorrecoesMes}" var="itemCorr">
                       <c:out value="${itemCorr.qtdCorrecoes}, "/>
                   </c:forEach>],
            tooltip: {
                valueSuffix: ''
            }
        }]
    });
});
$(function () {
    $('#container3').highcharts({
        title: {
            text: 'Média de notas / Mês',
            x: -20 //center
        },        
        xAxis: {
            categories: [<c:forEach items="${listaMediaMes}" var="itemMedia">
                            <c:out value="${itemAval.mes}, "/>
                        </c:forEach>]
        },
        yAxis: {
            title: {
                text: 'Média (%)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '%'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{           
            name: 'Turma',
            data: [<c:forEach items="${listaMediaMes}" var="itemMedia">
                        <c:out value="${itemMedia.media}, "/>
                  </c:forEach>]
        }]
    });
});
</script>