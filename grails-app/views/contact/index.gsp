<!DOCTYPE html>
<html>
<head>
  <title>: Ayuda</title>
  <meta name="layout" content="bootstrap">
</head>
<body>
<div class="page">
  <ol class="breadcrumb">
    <li><a href="${createLink(uri: '/') }">Inicio</a></li>
    <li class="active">Contacto</li>
  </ol>
	<div>
		<h2>¿Alguna duda, sugerencia o queja?</h2>
		
		<div class="col-md-8">
		
			<g:if test="${flash.error}">
				<div class="alert alert-danger">
					<g:message error="${flash.error}"/>
				</div>
			</g:if>
	
			<g:if test="${flash.message}">
				<div class="alert alert-success">
					${flash.message}
				</div>
			</g:if>
		
			<form action='${createLink(controller:'contact', action:'index')}' method='POST' autocomplete='off' class='form-horizontal'>
				<fieldset>
					<div class="form-group ${hasErrors(bean: userInstance, field: 'fullname', 'has-error')}">
						<div class="input-group input-group-lg">
							<span class="input-group-addon">
								<span class="fa flaticon-santaclaus"></span>
							</span>
							<textarea 
								   class="form-control"
								   name="message" required rows="10"></textarea>
	
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-lg btn-block"><span class="fa flaticon-star179"></span> Enviar</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
</body>
</html>