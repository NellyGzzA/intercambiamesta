<!DOCTYPE html>
<html>
	<head>
		<title>: Listado de intercambios</title>
		<meta name="layout" content="bootstrap">

		<style>
			.fa-big:before {
				font-size:80px !important;
				opacity:0.4;
			}
		</style>
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
				<a href="${createLink(action:"create")}" class="btn btn-secondary"><span class="fa fa-gift" style="width:20px;"></span> Nuevo intercambio</a>
			</div>

			<g:if test="${actualExchanges}">
				<div class="page-header">
					<h2>Intercambios activos</h2>
				</div>
				<div class="container-fluid">

					<div class="row">
						<g:each in="${actualExchanges}" status="i" var="exchangeInstance">
							<div class="col-md-3">
								<a href="${createLink(action:'show',id:exchangeInstance?.id) }">
									<section class="panel panel-box">
										<div class="panel-top bg-danger">
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
			<g:else>
				<div class="row" style="margin-top: 20px;">
					<div class="col-md-8 col-md-offset-2">
						<div class="well">
							<p class="text-center"><span class="fa flaticon-bell50 fa-big" </p>
							<p class="text-center">Antes de empezar, te invitamos seguir el tutorial en la sección de <a href="${createLink(controller: 'help', action: 'index')}">Ayuda</a>,
							te dará la información necesaria para administrar tus intercambios.</p>
						</div>
					</div>
				</div>
			</g:else>
			<g:if test="${pastExchanges}">
				<div class="page-header">
					<h2>Intercambios pasados</h2>
				</div>
				<div class="container-fluid">
					<div class="row">
						<g:each in="${pastExchanges}" status="i" var="exchangeInstance">
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
		</div>
	</body>
</html>
