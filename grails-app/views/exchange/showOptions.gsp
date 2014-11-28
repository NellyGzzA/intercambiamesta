<!DOCTYPE html>
<html>
	<head>
		<title>: Mis preferencias</title>
		<meta name="layout" content="bootstrap">
	</head>
	<body>
		<div class="container-fluid">
			
			<div class="row">
				<div class="page-header">
					<h1>Mis preferencias</h1>
				</div>
				<div class="col-md-3">	
					<g:if test="${flash.error}">
						<div class="alert alert-danger">
							<g:message error="${flash.error}"/>
						</div>
					</g:if>
					
					<g:if test="${flash.message}">
						<div class="alert alert-success">
							<g:message error="${flash.message}"/>
						</div>
					</g:if>
					
					<g:hasErrors bean="${exchangeInstance}">
						<g:eachError bean="${exchangeInstance}" var="error">
							<div class="alert alert-danger">
								<g:message error="${error}"/>
							</div>
						</g:eachError>
					</g:hasErrors>
					
					<form action='${createLink(controller:'exchange',action:'updateOptions')}' method='POST' autocomplete='off'>
						
						<div class="form-group">
							<label for="name">Primera opción</label>
							<input type="text" class="form-control" id="firstOption" placeholder="Primera opción" name="firstOption" required maxlength="100" value="${userExchange?.firstOption}">
						</div>
						
						<div class="form-group">
							<label for="name">Segunda opción</label>
							<input type="text" class="form-control" id="secondOption" placeholder="Segunda opción" name="secondOption" maxlength="100" value="${userExchange?.secondOption}">
						</div>
						
						<div class="form-group">
							<label for="name">Tercera opción</label>
							<input type="text" class="form-control" id="thirdOption" placeholder="Tercera opción" name="thirdOption" maxlength="100" value="${userExchange?.thirdOption}">
						</div>
						
						<div class="form-group">
							<label for="name">Comentarios</label>
							<textarea rows="4" cols="40" class="form-control" id="comments" placeholder="Comentarios" name="comments" maxlength="1000" >${userExchange?.comments}</textarea>
						</div>
						
						<g:hiddenField name="id" value="${exchangeInstance.id}"/>
						<g:hiddenField name="secret" value="${userExchange.secret}"/>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>