<table class="table table-hover table-striped">
	<thead>
	<tr>
		<th></th>
		<th>Nombre</th>
		<th>Le regala a</th>
		<th>Su primera opción</th>
		<th>Su segunda opción</th>
		<th>Su tercera opción</th>
		<th>Comentarios</th>
	</tr>
	</thead>
	<tbody>
	<g:each in="${exchangeInstance?.users}" status="i" var="userInstance">
		<tr>
			<td><img height="50" alt="${userInstance?.userFrom?.fullname}" src="http://www.Gravatar.com/avatar/${userInstance?.userFrom?.username?.toLowerCase()?.encodeAsMD5()}" class="img-circle"></td>
			<td>${userInstance?.userFrom?.fullname}</td>
			<td>${userInstance?.userTo?.fullname}</td>
			<td>${userInstance?.firstOption}</td>
			<td>${userInstance?.secondOption}</td>
			<td>${userInstance?.thirdOption}</td>
			<td>${userInstance?.comments}</td>
		</tr>

	</g:each>
	</tbody>
</table>