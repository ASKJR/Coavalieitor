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
		</div><!--/.row-->
                <div class="row">
                    <br/>
                </div>
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
		
</div>
 <script src="${pageContext.request.contextPath}/resource/js/dash_img.js" type="text/javascript" charset="utf-8"></script>
 	<script src="${pageContext.request.contextPath}/resource/js/chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/chart-data.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/easypiechart.js"></script>
	<script src="${pageContext.request.contextPath}/resource/js/easypiechart-data.js"></script>

<%@include file="../../include/footerProfessor.jsp" %>
