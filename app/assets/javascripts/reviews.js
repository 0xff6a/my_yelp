$(document).ready(function(){

	var popUp = $('<div></div>')

	popUp.dialog({autoOpen: false, 
								modal: true,
								resizeable: false, 
								title: 'Submit a review',
								minHeight: 250,
								minWidth: 400
	});

	$('.new-review-link').on('click', function(event){
		 event.preventDefault();
		 console.log(this.href);
		 popUp.load(this.href + '.review-input-form');
		 popUp.dialog('open');
		 $('a').off();
	});

});