<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		
		<meta property="og:image" content="http://i.imgur.com/C91cjNn.png">
		<meta property="og:title" content="Intercambiamesta">
		
		<title>Intercambiamesta<g:layoutTitle default=""/></title>
	
		<link href='//fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet'>

		<asset:stylesheet src="font-awesome.min.css"/>
		<asset:stylesheet src="flaticon.css"/>
		<asset:stylesheet src="theme.css"/>
	
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<g:layoutHead/>
	</head>

	<body id="${pageProperty(name: 'body.id')}">
		<section id="header" class="top-header">
			<header class="clearfix">
				<!-- Logo -->
				<div class="logo">
					<a href="${createLink(uri:'/')}">
						<asset:image src="logo.png" alt="Intercambiamesta" />
					</a>
				</div>

				<sec:ifLoggedIn>
					<div class="top-nav">
						<ul class="nav-left list-unstyled">
							<li class="dropdown text-normal nav-profile">
								<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">

									<img alt="${sec.loggedInUserInfo(field:'username')}"
										 src="http://www.Gravatar.com/avatar/${sec.loggedInUserInfo(field:'username').toLowerCase()?.encodeAsMD5()}" class="img-circle img30_30">

									<span class="hidden-xs">
										<sec:loggedInUserInfo field="username"/>
									</span>
								</a>

								<ul class="dropdown-menu dropdown-dark with-arrow">
									<li>
										<a href="${createLink(controller:'logout')}">
											<i class="fa fa-sign-out"></i>
											Salir
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</sec:ifLoggedIn>
			</header>
		</section>

		<aside id="nav-container">
			<sec:ifLoggedIn>
				<div id="nav-wrapper" data-nice-scroll>
					<ul id="nav"
						data-collapse-nav>
						<li class="${!controllerName ? 'active': ''}"><a href="${createLink(uri: '/') }">
							<i class="fa fa-home"></i>Inicio </a></li>

						<li class="${controllerName.equals('exchange') ? 'active': ''}"><a href="${createLink(action:'index',controller:'exchange') }">
							<i class="fa fa-gift"></i>Intercambios </a></li>

						<li class="${controllerName.equals('help') ? 'active': ''}"><a href="${createLink(action: 'index', controller: 'help')}">
							<i class="fa fa-question-circle"></i> Ayuda</a> </li>
						
						<li class="${controllerName.equals('contact') ? 'active': ''}"><a href="${createLink(action: 'index', controller: 'contact')}">
							<i class="fa fa-envelope"></i> Contacto</a> </li>
					</ul>
				</div>
			</sec:ifLoggedIn>
		</aside>

		<div class="view-container">
			<section id="content">
				<g:layoutBody/>
			</section>
		</div>

		<asset:javascript src="layout.js"/>
	</body>
</html>
