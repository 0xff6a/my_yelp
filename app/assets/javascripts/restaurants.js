$(document).ready(function(){

	var popUp = $('<div></div>')

	popUp.dialog({autoOpen: false, 
								modal: true,
								resizeable: false, 
								title: 'Add a new restaurant',
								minHeight: 250,
								minWidth: 400
	});

	$('#new-restaurant-link').click(function(){
		 event.preventDefault();
		 popUp.load('restaurants/new.html .restaurant-input-form');
		 popUp.dialog('open');

	});

});

