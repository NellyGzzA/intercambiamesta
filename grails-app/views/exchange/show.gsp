<!DOCTYPE html>
<html>
	<head>
		<title>: ${exchangeInstance?.name}</title>
		<meta name="layout" content="bootstrap">
		<asset:stylesheet src="datepicker.css"/>
	</head>
	<body>
		<div class="page">
			<ol class="breadcrumb">
				<li><a href="${createLink(uri: '/') }">Inicio</a></li>
				<li><a href="${createLink(action: 'index', controller: 'exchange') }">Intercambios</a></li>
				<li class="active">${exchangeInstance?.name}</li>
			</ol>

			<g:if test="${flash.error}">
				<div class="alert alert-danger">
					<g:message error="${flash.error}"/>
				</div>
			</g:if>

			<g:if test="${flash.message}">
				<div class="alert alert-success">
					${flash.message}
				</div>
			</g:if>
			
			<g:if test="${exchangeInstance.isEditable()}">
				<div class="row">
	
					<div class="col-md-3">
	
						<div class="page-header text-center">
							<h3>Datos generales</h3>
						</div>
	
						<form action='${createLink(controller:'exchange',action:'update')}' method='POST' autocomplete='off' class="form-horizontal" >
							<g:render template="form"/>
							<g:hiddenField name="id" value="${exchangeInstance?.id}"/>
	
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<button type="submit" class="btn btn-primary">Guardar</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-6">
						<div class="page-header text-center">
							<h3>Participantes <asset:image src="spinner.gif" class="hidden" id="spinner"/></h3>
						</div>
						<div id="users">
							<g:render template="users"/>
						</div>
					</div>
					<div class="col-md-3">
						<div class="page-header text-center">
							<h3>Operaciones</h3>
						</div>
						<div class="well">
							<p class="text-center"><a href="${createLink(controller:'exchange',action:'generate', id:exchangeInstance?.id) }" class="btn btn-primary ">Asignar usuarios</a></p>
							Se requieren al menos dos usuarios para poder crear la asignación.
						</div>
						<div class="well">
							<p class="text-center"><a href="${createLink(controller:'exchange',action:'sendMails', id:exchangeInstance?.id) }" class="btn btn-primary ">Enviar recordatorios</a></p>
							Manda el correo de detalle del intercambio, que incluye la persona a la que se le va a dar el regalo y la liga para escoger opciones.
						</div>
					</div>
				</div>
				<g:if test="${exchangeInstance?.users?.any{it?.userTo}}">
					<div class="row">
						<div class="page-header text-center">
							<h2><a class="spoilers">¡S P O I L E R S!</a></h2>
						</div>
	
						<div class="spoilerTable hidden">
							<g:render template="spoilers"></g:render>
						</div>
					</div>
				</g:if>
			</g:if>
			<g:else>
				<g:render template="spoilers"></g:render>
			</g:else>
		</div>

		<asset:javascript src="datepicker.js"/>
	</body>
</html>