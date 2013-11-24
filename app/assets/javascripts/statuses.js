var ready;

ready = function() {
	$('.status').hover( function(){
		console.log("hover!");
		$(this).toggleClass("hover");
	});
}

$(document).ready(ready);
$(document).on('page:load', ready);