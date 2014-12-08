<g:unless test="${exchangeInstance?.users?.any{it?.userFrom?.username == sec.username().toString()}}">
	<div class="row">
		<div class="text-right">
			<button type="button" class="btn btn-success btn-xs" id="addMe" data-id="${exchangeInstance?.id}">¡Agrégame!</button>
		</div>
		<hr>
	</div>
</g:unless>
<div class="row">
	<g:hasErrors bean="${userInstance}">
		<g:eachError bean="${userInstance}" var="error">
			<div class="alert alert-danger">
				<g:message error="${error}"/>
			</div>
		</g:eachError>
	</g:hasErrors>
	<form id="addNewUser" class="form-inline text-center" role="form">
		<div class="form-group">
			<label class="sr-only" for="fullname">Nombre Completo</label>
			<input type="text" name="fullname" class="form-control" id="fullname" placeholder="Nombre Completo" value="${userInstance?.fullname}" required>
		</div>
		<div class="form-group">
			<label class="sr-only" for="username">Correo Electrónico</label>
			<input type="email" class="form-control" id="username" name="username" placeholder="Correo Electrónico" value="${userInstance?.username}" required>
		</div>
		<g:hiddenField name="id" value="${exchangeInstance?.id}"/>
		<button type="submit" class="btn btn-primary" id="btn-addNewUser">Agregar</button>
	</form>
	<hr>
</div>

<g:if test="${exchangeInstance?.users}">
	<div class="row">
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th></th>
					<th>Nombre</th>
					<th>Correo</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${exchangeInstance?.users}" status="i" var="userInstance">
					<tr>
						<td><img height="25" alt="${userInstance?.userFrom?.fullname}" src="http://www.Gravatar.com/avatar/${userInstance?.userFrom?.username?.toLowerCase()?.encodeAsMD5()}" class="img-circle"></td>
						<td>${userInstance?.userFrom?.fullname}</td>
						<td>${userInstance?.userFrom?.username}</td>
						<td>
						
						<g:unless test="${userInstance?.userTo}">
							<button class="btn btn-danger btn-xs removeUser" data-id="${exchangeInstance?.id}" data-username="${userInstance?.userFrom?.username}"><span class="glyphicon glyphicon-remove"></span></button>
						</g:unless>
						
						</td>
					</tr>
					
				</g:each>
			</tbody>
		</table>
	</div>
</g:if>