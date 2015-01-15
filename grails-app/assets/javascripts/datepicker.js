//= require jquery
//= require moment.min.js
//= require es.js
//= require bootstrap-datetimepicker.js

$('#datetimepicker').datetimepicker({
	pickTime: false
});

$(document).on('submit','#addNewUser', function(e){
	e.preventDefault();

	$('#btn-addNewUser').addClass('disabled');
	$("#spinner").attr("class", "");
	jQuery.ajax({
		type:'POST',
		data:$('#addNewUser').serialize(),
		url:'/exchange/addNewUser',
		success:function(data,textStatus){
			jQuery('#users').html(data);
			$("#spinner").attr("class", "hide");
		},
		error:function(XMLHttpRequest,textStatus,errorThrown){
			console.log(XMLHttpRequest.responseText);
		}
	});
});

$(document).on('click','#addMe', function(){
	$(this).addClass('disabled');
	$("#spinner").attr("class", "");
	jQuery.ajax({
		type:'POST',
		data:'id=' + $(this).data('id'),
		url:'/exchange/addMe',
		success:function(data,textStatus){
			jQuery('#users').html(data);
			$("#spinner").attr("class", "hide");
		},
		error:function(XMLHttpRequest,textStatus,errorThrown){
			console.log(XMLHttpRequest.responseText);
		}
	});
});

$(document).on('click','.removeUser', function(){
	$(this).addClass('disabled');
	$("#spinner").attr("class", "");
	jQuery.ajax({
		type:'POST',
		data:'id=' + $(this).data('id') + '&username='+ $(this).data('username'),
		url:'/exchange/removeUser',
		success:function(data,textStatus){
			jQuery('#users').html(data);
			$("#spinner").attr("class", "hide");
		},
		error:function(XMLHttpRequest,textStatus,errorThrown){
			console.log(XMLHttpRequest.responseText);
		}
	});
});

$(document).on('click','.spoilers', function(){
	if($('.spoilerTable').hasClass( "hidden" ) && confirm("¿Seguro que quieres ver?") && confirm("¿En serio? ¡No hagas trampa!")){
		$('.spoilerTable').removeClass( "hidden" );
	}
});

