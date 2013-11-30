var ready;

ready = function() {
	$('.status').hover( function(){
		console.log("hover!");
		$(this).toggleClass("hover");
	});

/*	$('a').click(function(){
		$(this).html("js works");
	});
*/
}

$(document).ready(ready);
$(document).on('page:load', ready);