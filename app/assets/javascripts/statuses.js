var ready;
	console.log("Loaded");
	$('.meta').hover( function(){
		console.log("Hover triggered");
	});

$(document).ready(ready);
$(document).on('page:load', ready);