<!DOCTYPE html>
<html>
	<head>
		<title>: Registro</title>
		<meta name="layout" content="bootstrap">
	</head>
	<body>
		
		<div class="container-fluid">
			
			<div class="row">
			
				<div class="col-md-4 col-md-offset-4">
					<div class="page-header">
						<h1>Registro</h1>
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
					
					<form action='${createLink(controller:'user', action:'save')}' method='POST' autocomplete='off'>
						<div class="form-group">
							<label for="fullname">Nombre Completo</label>
							<input type="text" value="${userInstance?.fullname}" class="form-control" id="fullname" placeholder="Enter your name" name="fullname" required maxlength="100">
						</div>
						<div class="form-group">
							<label for="username">Correo Electrónico</label>
							<input type="email" value="${userInstance?.username}" class="form-control" id="username" placeholder="Enter email" name="username" required maxlength="100">
						</div>
						<div class="form-group">
							<label for="passwordRegister">Contraseña</label>
							<input type="password" value="${userInstance?.password}" class="form-control" id="password" placeholder="Password" name="password" required>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
				
			</div>
		</div>
	</body>
</html>
