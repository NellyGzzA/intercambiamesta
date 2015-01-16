<!DOCTYPE html>
<html>
	<head>
		<title>: Registro</title>
		<meta name="layout" content="bootstrap">

		<asset:stylesheet src="options.css"/>
	</head>
	<body>
		<div class="page-signin">

		<div class="signin-header">
			<div class="overlay"></div>

			<div class="container text-center">
				<section class="logo" style="margin-bottom: 10px;">
					<a href="${createLink(uri: '/')}"><asset:image src="logo-big.png" alt="Intercambiamesta" /></a>
				</section>

				<p class="lead" style="margin-bottom: 0"><strong>¡Feliz navidad!</strong> y nuestros mejores deseos</p>
				<p>Gracias por ser parte de la familia <a href="http://vincoorbis.com/#!/" class="a-brand">Vinco Orbis</a></p>
			</div>
		</div>

		<div class="signin-body">
			<div class="container">
				<div class="form-container">
					<span class="line-thru">REGISTRO</span>

					<form action='${createLink(controller:'user', action:'save')}' method='POST' autocomplete='off' class='form-horizontal'>
						<fieldset>
							<div class="form-group ${hasErrors(bean: userInstance, field: 'fullname', 'has-error')}">
								<div class="input-group input-group-lg">
									<span class="input-group-addon">
										<span class="fa flaticon-santaclaus"></span>
									</span>
									<input type="text"
										   class="form-control"
										   placeholder="Nombre completo"
										   value="${userInstance?.fullname}"
										   name="fullname" required maxlength="100">

								</div>

								<g:hasErrors bean="${userInstance}" field="fullname">
									<g:eachError bean="${userInstance}" field="fullname" var="error">
										<p class="help-block"><g:message error="${error}"/></p>
									</g:eachError>
								</g:hasErrors>
							</div>
							<div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'has-error')}">
								<div class="input-group input-group-lg">
									<span class="input-group-addon">
										<span class="glyphicon flaticon-sign16"></span>
									</span>
									<input type="email"
										   class="form-control"
										   placeholder="Correo electrónico"
										   value="${userInstance?.username}"
										   name="username" required maxlength="100">

								</div>

								<g:hasErrors bean="${userInstance}" field="username">
									<g:eachError bean="${userInstance}" field="username" var="error">
										<p class="help-block"><g:message error="${error}"/></p>
									</g:eachError>
								</g:hasErrors>
							</div>
							<div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'has-error')}">
								<div class="input-group input-group-lg">
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-lock"></span>
									</span>
									<input type="password"
										   class="form-control"
										   placeholder="Contraseña"
										   value="${userInstance?.password}"
										   name="password" required>
								</div>

								<g:hasErrors bean="${userInstance}" field="password">
									<g:eachError bean="${userInstance}" field="password" var="error">
										<p class="help-block"><g:message error="${error}"/></p>
									</g:eachError>
								</g:hasErrors>
							</div>
							<g:if test="${flash.error}">
								<div class="alert alert-danger">
									<g:message error="${flash.error}"/>
								</div>
							</g:if>
							<div class="form-group">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-lg btn-block"><span class="fa flaticon-star179"></span> Registrar</button>
							</div>
						</fieldset>
					</form>

					<section>
						<p class="text-center text-muted text-small">¿Ya tienes cuenta?
							<a href="${createLink(controller:'login', action:'auth')}">Inicia sesión</a></p>
					</section>

				</div>
			</div>
		</div>
	</div>
	</body>
</html>
