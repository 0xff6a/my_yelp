$(document).ready(function(){

	$('.new-rubbish-link').off().on('click', function(){
		event.preventDefault();
		var rateCount = $(this).siblings('.rubbish-count');

		$.post(this.href, function(response){
			rateCount.text(response.new_rubbishes_count);
		});

	});

});