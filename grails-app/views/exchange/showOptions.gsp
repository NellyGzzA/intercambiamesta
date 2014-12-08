<!DOCTYPE html>
<html>
<head>
	<title>: Mis preferencias</title>
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
				<span class="line-thru">MIS PREFERENCIAS</span>

				<form action='${createLink(controller:'exchange',action:'updateOptions')}' method='POST' autocomplete='off' class='form-horizontal'>

					<fieldset>
						<div class="form-group ${hasErrors(bean: userExchange, field: 'firstOption', 'has-error')}">

							<div class="input-group input-group-lg">
								<span class="input-group-addon">
									<span class="glyphicon flaticon-present20"></span>
								</span>

								<input type="text" class="form-control" id="firstOption" placeholder="Primera opción" name="firstOption" required maxlength="100" value="${userExchange?.firstOption}">
							</div>

							<g:hasErrors bean="${exchangeInstance}" field="firstOption">
								<g:eachError bean="${exchangeInstance}" field="firstOption" var="error">
									<p class="help-block"><g:message error="${error}"/></p>
								</g:eachError>
							</g:hasErrors>
						</div>

						<div class="form-group ${hasErrors(bean: userExchange, field: 'secondOption', 'has-error')}">
							<div class="input-group input-group-lg">
								<span class="input-group-addon">
									<span class="glyphicon flaticon-rocking3"></span>
								</span>

								<input type="text" class="form-control" id="secondOption" placeholder="Segunda opción" name="secondOption" maxlength="100" value="${userExchange?.secondOption}">
							</div>

							<g:hasErrors bean="${exchangeInstance}" field="secondOption">
								<g:eachError bean="${exchangeInstance}" field="secondOption" var="error">
									<p class="help-block"><g:message error="${error}"/></p>
								</g:eachError>
							</g:hasErrors>
						</div>

						<div class="form-group ${hasErrors(bean: userExchange, field: 'thirdOption', 'has-error')}">

							<div class="input-group input-group-lg">
								<span class="input-group-addon">
									<span class="glyphicon flaticon-teddy"></span>
								</span>

								<input type="text" class="form-control" id="thirdOption" placeholder="Tercera opción" name="thirdOption" maxlength="100" value="${userExchange?.thirdOption}">
							</div>

							<g:hasErrors bean="${exchangeInstance}" field="thirdOption">
								<g:eachError bean="${exchangeInstance}" field="thirdOption" var="error">
									<p class="help-block"><g:message error="${error}"/></p>
								</g:eachError>
							</g:hasErrors>
						</div>

						<div class="form-group ${hasErrors(bean: userExchange, field: 'comments', 'has-error')}">
							<textarea rows="4" cols="40" class="form-control input-lg" id="comments" placeholder="Comentarios" name="comments" maxlength="1000" >${userExchange?.comments}</textarea>

							<g:hasErrors bean="${exchangeInstance}" field="comments">
								<g:eachError bean="${exchangeInstance}" field="comments" var="error">
									<p class="help-block"><g:message error="${error}"/></p>
								</g:eachError>
							</g:hasErrors>
						</div>

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

						<g:hiddenField name="id" value="${exchangeInstance.id}"/>
						<g:hiddenField name="secret" value="${userExchange.secret}"/>

						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-lg btn-block"><span class="fa flaticon-stocking1"></span> Enviar</button>
						</div>
					</fieldset>
				</form>

			</div>
		</div>
	</div>
</div>
</body>
</html>
