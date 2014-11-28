<!DOCTYPE html>
<html>
	<head>
		<title>: Acceso</title>
		<meta name="layout" content="bootstrap">
	</head>
	<body>
		
		<div class="container-fluid">
			
			<div class="row">
				
				<div class="col-md-4 col-md-offset-4">
					<div class="page-header">
						<h1>Acceso</h1>
					</div>
					
					<g:if test='${flash.message}'>
						<div class="alert alert-danger" role="alert">${flash.message}</div>
					</g:if>
					
					<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
						<div class="form-group">
							<label for="email">Correo Electrónico</label>
							<input type="email" class="form-control" id="email" placeholder="Enter email" name="j_username" required maxlength="100">
						</div>
						
						<div class="form-group">
							<label for="password">Password</label>
							<input type="password" class="form-control" id="password" placeholder="Password" name="j_password" required>
						</div>
						
						<div class="form-group">
							<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
							<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
						</div>
						
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
