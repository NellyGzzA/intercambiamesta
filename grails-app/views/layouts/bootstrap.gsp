<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>Intercambiamesta<g:layoutTitle default=""/></title>
	
		<asset:stylesheet src="layout.css"/>
	
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<g:layoutHead/>
	</head>

	<body>
		<!-- Fixed navbar -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${createLink(uri:'/')}">Intercambiamesta</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<%-- <li class="active"><a href="#">Home</a></li> --%>
						<sec:ifNotLoggedIn>
							<li class="${controllerName == 'login' && actionName == 'auth' ? 'active':''}"><a href="${createLink(controller:'login', action:'auth')}">Acceso</a></li>
							<li class="${controllerName == 'user' && actionName == 'register' ? 'active':''}"><a href="${createLink(controller:'user', action:'register')}">Registro</a></li>
						</sec:ifNotLoggedIn>
						<sec:ifLoggedIn>
							<li class="${controllerName == 'exchange' ? 'active':''}"><a href="${createLink(action:'index',controller:'exchange') }">Intercambios</a></li>
							<li><a href="${createLink(controller:'logout')}">Salir</a></li>
						</sec:ifLoggedIn>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</nav>

		<!-- Begin page content -->
		<div class="container">
			<g:layoutBody/>
		</div>

		<footer class="footer">
			<div class="container">
				<p class="text-muted">Intercambiamesta 2014</p>
			</div>
		</footer>

		<asset:javascript src="layout.js"/>
	</body>
</html>
