<!DOCTYPE html>
<html>
	<head>
		<title>: Listado de intercambios</title>
		<meta name="layout" content="bootstrap">
	</head>
	<body>
		<g:if test="${flash.error}">
			<div class="alert alert-danger">
				<g:message error="${flash.error}"/>
			</div>
		</g:if>
		<div class="text-center"><h1> <span class="glyphicon glyphicon-gift"></span> <a href="${createLink(action:"create")}">Nuevo intercambio</a></h1></div>
		<g:if test="${actualExchanges}">
			<div class="page-header">
				<h2>Intercambios activos</h2>
			</div>
			<div class="container-fluid">
				
				<div class="row">
					<g:each in="${actualExchanges}" status="i" var="exchangeInstance">
							<a href="${createLink(action:'show',id:exchangeInstance?.id) }">
								<div class="col-md-4 text-center">
									<div>
										<h3><span class="glyphicon glyphicon-gift"></span></h3>
										<h4>${exchangeInstance.name}</h4>
										${exchangeInstance?.endDate?.format("dd/MM/yyyy") }
									</div>
								</div>
							</a>
					</g:each>
				</div>
				
			</div>
		</g:if>
		<g:if test="${pastExchanges}">
			<div class="page-header">
				<h2>Intercambios activos</h2>
			</div>
			<div class="container-fluid">
				<div class="row">
					<g:each in="pastExchanges" status="i" var="exchangeInstance">
						<a href="${createLink(action:'show',id:exchangeInstance?.id) }">
							<div class="col-md-4 text-center">
								<div>
									<h3><span class="glyphicon glyphicon-gift"></span></h3>
									<h4>${exchangeInstance.name}</h4>
									${exchangeInstance?.endDate?.format("dd/MM/yyyy") }
								</div>
							</div>
						</a>
					</g:each>
				</div>
			</div>
		</g:if>
	</body>
</html>