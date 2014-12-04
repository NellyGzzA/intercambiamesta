<!DOCTYPE html>
<html>
	<head>
		<title>: Crear intercambio</title>
		<meta name="layout" content="bootstrap">
		<asset:stylesheet src="datepicker.css"/>
	</head>
	<body>
		<div class="page">
			<ol class="breadcrumb">
				<li><a href="${createLink(uri: '/') }">Inicio</a></li>
				<li><a href="${createLink(action:'index',controller:'exchange') }">Intercambios</a></li>
				<li class="active">Nuevo intercambio</li>
			</ol>

			<div class="panel panel-default">
				<div class="panel-heading">
					<strong><span class="fa fa-gift fa-lg" style="width:20px;"></span> Nuevo intercambio</strong>
				</div>

				<div class="panel-body">
					<g:if test="${flash.error}">
						<div class="alert alert-danger">
							<g:message error="${flash.error}"/>
						</div>
					</g:if>

					<g:hasErrors bean="${exchangeInstance}">
						<g:eachError bean="${exchangeInstance}" var="error">
							<div class="alert alert-danger">
								<g:message error="${error}"/>
							</div>
						</g:eachError>
					</g:hasErrors>

					<form action='${createLink(controller:'exchange',action:'save')}' class="form-horizontal" method='POST' autocomplete='off'>
						<g:render template="form"/>

						<div class="form-group">
							<div class="col-md-offset-2 col-md-6">
								<button type="submit" class="btn btn-primary"><span class="fa flaticon-stocking1"></span> Crear intercambio</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<asset:javascript src="datepicker.js"/>
	</body>
</html>