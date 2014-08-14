$(document).ready(function(){

	$('.restaurant-input-form').dialog({autoOpen: false, 
																			resizeable: false, 
																			title: 'Add a new resturant'})

	$('#new-restaurant-link').click(function(){
		 event.preventDefault();
	})
})