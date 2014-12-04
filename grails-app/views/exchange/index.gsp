<!DOCTYPE html>
<html>
	<head>
		<title>: Listado de intercambios</title>
		<meta name="layout" content="bootstrap">
	</head>
	<body>
		<div class="page">
			<ol class="breadcrumb">
				<li><a href="${createLink(uri: '/') }">Inicio</a></li>
				<li class="active">Intercambios</li>
			</ol>

			<g:if test="${flash.error}">
				<div class="alert alert-danger">
					<g:message error="${flash.error}"/>
				</div>
			</g:if>

			<div class="text-right">
				<a href="${createLink(action:"create")}" class="btn btn-primary"><span class="fa fa-gift" style="width:20px;"></span> Nuevo intercambio</a>
			</div>

			<g:if test="${actualExchanges}">
				<div class="page-header">
					<h2><span class="fa flaticon-sparkler"></span> Intercambios activos</h2>
				</div>
				<div class="container-fluid">

					<div class="row">
						<g:each in="${actualExchanges}" status="i" var="exchangeInstance">
							<div class="col-md-3">
								<a href="${createLink(action:'show',id:exchangeInstance?.id) }">
									<section class="panel panel-box">
										<div class="panel-top bg-success">
											<i class="fa fa-gift text-large"></i>
										</div>
										<div class="panel-bottom bg-reverse">
											<p class="size-h1">${exchangeInstance.name}</p>
											<p class="text-muted">${exchangeInstance?.endDate?.format("dd/MM/yyyy") }</p>
										</div>
									</section>
								</a>
							</div>
						</g:each>
					</div>

				</div>
			</g:if>

			<g:if test="${pastExchanges}">
				<div class="page-header">
					<h2>Intercambios activos</h2>
				</div>
				<div class="container-fluid">
					<div class="row">
						<g:each in="pastExchanges" status="i" var="exchangeInstance">
							<div class="col-md-4">
								<a href="${createLink(action:'show',id:exchangeInstance?.id) }">
									<section class="panel panel-box info-box">
										<div class="panel-left panel-item bg-danger">
											<i class="fa fa-gift text-large stat-icon"></i>
										</div>
										<div class="panel-right panel-item bg-reverse">
											<p class="size-h1 no-margin">${exchangeInstance.name}</p>
											<p class="text-muted no-margin">${exchangeInstance?.endDate?.format("dd/MM/yyyy") }</p>
										</div>
									</section>
								</a>
							</div>
						</g:each>
					</div>
				</div>
			</g:if>
		</div>
	</body>
</html>