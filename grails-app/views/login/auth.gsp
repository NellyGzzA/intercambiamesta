<!DOCTYPE html>
<html>
	<head>
		<title>: Acceso</title>
		<meta name="layout" content="bootstrap">
	</head>
	<body id="login">
		<div class="page-signin">
			<div class="signin-header">
				<div class="container text-center">
					<section class="logo" style="margin-bottom: 10px;">
						<a href="${createLink(uri: '/')}"><asset:image src="logo-big.png" alt="Intercambiamesta" /></a>
					</section>

					<p class="lead"><strong>¡Feliz día del amor y la amistad!</strong></p>
				</div>
			</div>

			<div class="signin-body">
				<div class="container">
					<div class="form-container">
						<span class="line-thru">ACCESO</span>
						
						<g:if test='${flash.message}'>
							<div class="alert alert-danger" role="alert">${flash.message}</div>
						</g:if>
						
						<form action='${postUrl}' method='POST' id='loginForm' class='form-horizontal' autocomplete='off'>
							<fieldset>
								<div class="form-group">
									<div class="input-group input-group-lg">
										<span class="input-group-addon login-addon">
											<span class="fa flaticon-heart22"></span>
										</span>
										<input type="email"
											   class="form-control"
											   placeholder="Correo electrónico"
											   name="j_username" required maxlength="100">

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
											   name="j_password" required>
									</div>
								</div>
								<div class="form-group">
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-lg btn-block">Iniciar sesión</button>
								</div>
							</fieldset>
						</form>

						<section>
							<p class="text-center text-muted text-small">¿No tienes cuenta?
								<a href="${createLink(controller:'user', action:'register')}"
								   class="registration" data-placement="bottom">Regístrate</a></p>
						</section>

					</div>
				</div>
			</div>
		</div>
	</body>
</html>
