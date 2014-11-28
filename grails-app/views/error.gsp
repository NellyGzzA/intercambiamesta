<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="bootstrap">
		<asset:stylesheet src="errors.css"/>
	</head>
	<body>
		<g:renderException exception="${exception}" />
	</body>
</html>
