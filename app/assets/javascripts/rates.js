$(document).ready(function(){

	$('.new-rate-link').off().on('click', function(){
		event.preventDefault();
		var rateCount = $(this).siblings('.rates-count');

		$.post(this.href, function(response){
			rateCount.text(response.new_rates_count);
		});

	});

});