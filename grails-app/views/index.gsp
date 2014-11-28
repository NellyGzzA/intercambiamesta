<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<meta name="layout" content="bootstrap">
	</head>
	<body>
		<div class="jumbotron"><h1 class="text-center">I N T E R C A M B I A M E S T A</h1></div>
		<sec:ifLoggedIn>
		<div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-4">
						<div class="page-header">
							<h2><span class="glyphicon glyphicon-gift"></span> <a href="${createLink(action:'index',controller:'exchange') }">Intercambios</a></h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		</sec:ifLoggedIn>
	</body>
</html>