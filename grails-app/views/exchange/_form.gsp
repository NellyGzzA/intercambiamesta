<div class="form-group ${hasErrors(bean:exchangeInstance, field: 'name', 'has-error')}">
	<label for="name" class="col-md-4 control-label">Nombre</label>

	<div class="col-md-8">
		<input type="text" class="form-control" id="name" placeholder="Ingresa el nombre" name="name" required maxlength="100" value="${exchangeInstance?.name}">

		<g:hasErrors bean="${exchangeInstance}" field="name">
			<g:eachError bean="${exchangeInstance}" field="name" var="error">
				<p class="help-block"><g:message error="${error}"/></p>
			</g:eachError>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean:exchangeInstance, field: 'endDate', 'has-error')}">
	<label for="endDate" class="col-md-4 control-label">Fecha</label>

	<div class="col-md-8">
		<div class='input-group date' id='datetimepicker'>
			<input type='text' class="form-control" name="endDate" id="endDate" readonly="readonly" required value="${ (exchangeInstance?.endDate ?: (new Date() + 1).clearTime()).format("dd/MM/yyyy") }" maxlength="100"/>
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		</div>

		<g:hasErrors bean="${exchangeInstance}" field="endDate">
			<g:eachError bean="${exchangeInstance}" field="endDate" var="error">
				<p class="help-block"><g:message error="${error}"/></p>
			</g:eachError>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean:exchangeInstance, field: 'theme', 'has-error')}">
	<label for="theme" class="col-md-4 control-label">Tema</label>

	<div class="col-md-8">
		<input type="text" class="form-control" id="theme" placeholder="Escoge el tema" name="theme" required maxlength="100" value="${exchangeInstance?.theme}">

		<g:hasErrors bean="${exchangeInstance}" field="theme">
			<g:eachError bean="${exchangeInstance}" field="theme" var="error">
				<p class="help-block"><g:message error="${error}"/></p>
			</g:eachError>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean:exchangeInstance, field: 'limitAmount', 'has-error')}">
	<label for="limitAmount" class="col-md-4 control-label">Limite</label>

	<div class="col-md-8">
		<div class="input-group">
			<span class="input-group-addon">$</span>
			<input type="number" class="form-control" id="limitAmount" placeholder="Establece un límite" name="limitAmount" required min="0" step="1" value="${exchangeInstance?.limitAmount}" maxlength="100">
		</div>

		<g:hasErrors bean="${exchangeInstance}" field="limitAmount">
			<g:eachError bean="${exchangeInstance}" field="limitAmount" var="error">
				<p class="help-block"><g:message error="${error}"/></p>
			</g:eachError>
		</g:hasErrors>
	</div>
</div>