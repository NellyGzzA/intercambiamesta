<!DOCTYPE html>
<html>
	<head>
		<title>: Registro</title>
		<meta name="layout" content="bootstrap">

		<style>
		aside, #header {
			display: none !important;
		}

		#content {
			top: 0;
			left: 0;
		}
		</style>
	</head>
	<body>
		<div class="page-signin">

		<div class="signin-header">
			<div class="overlay"></div>

			<div class="container text-center">
				<section class="logo">
					<asset:image src="logo-big.png" alt="Intercambiamesta" />
				</section>

				<p class="lead">El tradicional intercambio navideño en Vinco Orbis</p>
			</div>
		</div>

		<div class="signin-body">
			<div class="container">
				<div class="form-container">
					<span class="line-thru">REGISTRO</span>

					<form action='${createLink(controller:'user', action:'save')}' method='POST' autocomplete='off' class='form-horizontal'>
						<fieldset>
							<div class="form-group">
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
							</div>
							<div class="form-group">
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
							</div>
							<div class="form-group">
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
							</div>
							<g:if test="${flash.error}">
								<div class="alert alert-danger">
									<g:message error="${flash.error}"/>
								</div>
							</g:if>

							<g:hasErrors bean="${userInstance}">
								<g:eachError bean="${userInstance}" var="error">
									<div class="alert alert-danger">
										<g:message error="${error}"/>
									</div>
								</g:eachError>
							</g:hasErrors>
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
