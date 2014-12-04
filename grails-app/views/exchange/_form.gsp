<div class="form-group">
	<label for="name" class="col-md-2 control-label">Nombre</label>

	<div class="col-md-6">
		<input type="text" class="form-control" id="name" placeholder="Ingresa el nombre" name="name" required maxlength="100" value="${exchangeInstance?.name}">
	</div>
</div>

<div class="form-group">
	<label for="endDate" class="col-md-2 control-label">Fecha</label>

	<div class="col-md-6">
		<div class='input-group date' id='datetimepicker'>
			<input type='text' class="form-control" name="endDate" id="endDate" readonly="readonly" required value="${ (exchangeInstance?.endDate ?: (new Date() + 1).clearTime()).format("dd/MM/yyyy") }" maxlength="100"/>
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		</div>
	</div>
</div>

<div class="form-group">
	<label for="theme" class="col-md-2 control-label">Tema</label>

	<div class="col-md-6">
		<input type="text" class="form-control" id="theme" placeholder="Escoge el tema" name="theme" required maxlength="100" value="${exchangeInstance?.theme}">
	</div>
</div>

<div class="form-group">
	<label for="limitAmount" class="col-md-2 control-label">Limite</label>

	<div class="col-md-6">
		<div class="input-group">
			<span class="input-group-addon">$</span>
			<input type="number" class="form-control" id="limitAmount" placeholder="Establece un límite" name="limitAmount" required min="0" step="1" value="${exchangeInstance?.limitAmount}" maxlength="100">
		</div>
	</div>
</div>