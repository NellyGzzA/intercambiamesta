<!DOCTYPE html>
<html>
	<head>
		<title>: Acceso</title>
		<meta name="layout" content="bootstrap">

		<style>
			aside, #header {
				display: none !important;
			}

			#content {
				top: 0;
				left: 0;
			 }

			.page-signin .signin-header {
				background: #a72f38 url("${resource(dir: 'images', file: 'banner2.jpg')}") center center no-repeat!important;
				height:180px;
			}

			.page-signin .signin-header:after {
				content: " ";
				background: url(${resource(dir: 'images', file: 'tiranisu.png')}) top left no-repeat;
				position:absolute;
				bottom:0;
				left:10%;
				display:block;
				width:414px;
				height:180px;
			}

			.page-signin .signin-header .overlay {
				opacity:0.5;
			}
		</style>
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
					<p>Gracias por ser parte de la familia Vinco Orbis</p>
				</div>
			</div>

			<div class="signin-body">
				<div class="container">
					<div class="form-container">
						<span class="line-thru">ACCESO</span>

						<form action='${postUrl}' method='POST' id='loginForm' class='form-horizontal' autocomplete='off'>
							<fieldset>
								<div class="form-group">
									<div class="input-group input-group-lg">
										<span class="input-group-addon">
											<span class="glyphicon flaticon-sign16"></span>
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
								<g:if test='${flash.message}'>
									<div class="alert alert-danger" role="alert">${flash.message}</div>
								</g:if>
								<div class="form-group">
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-lg btn-block"><span class="fa flaticon-star179"></span> Iniciar sesión</button>
								</div>
							</fieldset>
						</form>

						<section>
							<p class="text-center text-muted text-small">¿No tienes cuenta?
								<a href="${createLink(controller:'user', action:'register')}">Regístrate</a></p>
						</section>

					</div>
				</div>
			</div>
		</div>
	</body>
</html>
