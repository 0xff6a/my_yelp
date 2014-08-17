$(document).ready(function(){

	$('.new-rubbish-link').off().on('click', function(){
		event.preventDefault();
		var rubbishCount = $(this).siblings('.rubbish-count');

		$.post(this.href, function(response){
			rubbishCount.text(response.new_rubbishes_count);
		});

	});

});