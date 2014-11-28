<!DOCTYPE html>
<html>
	<head>
		<title>: Crear intercambio</title>
		<meta name="layout" content="bootstrap">
		<asset:stylesheet src="datepicker.css"/>
	</head>
	<body>
		<div class="container-fluid">
			
			<div class="row">
				<div class="page-header">
					<h1>Nuevo intercambio</h1>
				</div>
				<div class="col-md-3">	
					<g:if test="${flash.error}">
						<div class="alert alert-danger">
							<g:message error="${flash.error}"/>
						</div>
					</g:if>
					
					<g:hasErrors bean="${exchangeInstance}">
						<g:eachError bean="${exchangeInstance}" var="error">
							<div class="alert alert-danger">
								<g:message error="${error}"/>
							</div>
						</g:eachError>
					</g:hasErrors>
					
					<form action='${createLink(controller:'exchange',action:'save')}' method='POST' autocomplete='off'>
						<g:render template="form"/>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
		<asset:javascript src="datepicker.js"/>
	</body>
</html>