<div class="form-group">
	<label for="name">Nombre</label>
	<input type="text" class="form-control" id="name" placeholder="Enter name" name="name" required maxlength="100" value="${exchangeInstance?.name}">
</div>

<div class="form-group">
	<label for="endDate">Fecha</label>
	<div class='input-group date' id='datetimepicker'>
		<input type='text' class="form-control" name="endDate" id="endDate" readonly="readonly" required value="${ (exchangeInstance?.endDate ?: (new Date() + 1).clearTime()).format("dd/MM/yyyy") }" maxlength="100"/>
		<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	</div>
</div>

<div class="form-group">
	<label for="theme">Tema</label>
	<input type="text" class="form-control" id="theme" placeholder="Enter theme" name="theme" required maxlength="100" value="${exchangeInstance?.theme}">
</div>

<div class="form-group">
	<label for="limitAmount">Limite</label>
	<input type="number" class="form-control" id="limitAmount" placeholder="Enter limit" name="limitAmount" required min="0" step="1" value="${exchangeInstance?.limitAmount}" maxlength="100">
</div>