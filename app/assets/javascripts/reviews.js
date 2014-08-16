$(document).ready(function(){

	var popUp = $('<div></div>')

	popUp.dialog({autoOpen: false, 
								modal: true,
								resizeable: false, 
								title: 'Submit a review',
								minHeight: 250,
								minWidth: 400
	});

	$('.new-review-link').off().on('click', function(event){
		 popUpFormFrom(this.href + '.html' + ' .review-input-form', popUp);
	});

});