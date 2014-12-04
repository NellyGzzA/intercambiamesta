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

			<div class="row">

				<div class="col-md-3">

					<div class="page-header text-center">
						<h3>Datos generales</h3>
					</div>

					<g:hasErrors bean="${exchangeInstance}">
						<g:eachError bean="${exchangeInstance}" var="error">
							<div class="alert alert-danger">
								<g:message error="${error}"/>
							</div>
						</g:eachError>
					</g:hasErrors>

					<form action='${createLink(controller:'exchange',action:'update')}' method='POST' autocomplete='off'>
						<g:render template="form"/>
						<g:hiddenField name="id" value="${exchangeInstance?.id}"/>
						<button type="submit" class="btn btn-primary">Submit</button>
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
						Se requieren al menos tres usuarios para poder crear la asignación.
					</div>
					<div class="well">
						<p class="text-center"><a href="${createLink(controller:'exchange',action:'forceGenerate', id:exchangeInstance?.id) }" class="btn btn-primary ">Forzar asignación</a></p>
						Se resetea la asignación actual y se asignan los puestos de nuevo.
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
						<table class="table table-hover table-striped">
							<thead>
							<tr>
								<th></th>
								<th>Nombre</th>
								<th>Le regala a</th>
								<th>Su primera opción</th>
								<th>Su segunda opción</th>
								<th>Su tercera opción</th>
								<th>Comentarios</th>
							</tr>
							</thead>
							<tbody>
							<g:each in="${exchangeInstance?.users}" status="i" var="userInstance">
								<tr>
									<td><img height="50" alt="${userInstance?.userFrom?.fullname}" src="http://www.Gravatar.com/avatar/${userInstance?.userFrom?.username?.toLowerCase()?.encodeAsMD5()}" class="img-circle"></td>
									<td>${userInstance?.userFrom?.fullname}</td>
									<td>${userInstance?.userTo?.fullname}</td>
									<td>${userInstance?.firstOption}</td>
									<td>${userInstance?.secondOption}</td>
									<td>${userInstance?.thirdOption}</td>
									<td>${userInstance?.comments}</td>
								</tr>

							</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</g:if>
		</div>

		<asset:javascript src="datepicker.js"/>
	</body>
</html>