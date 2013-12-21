var ready;

ready = function(){
	$('#add-friendship').click(function(event){
		event.preventDefault();
		var addFriendshipBtn = $(this);
		$.ajax({
			url: Routes.new_friendship_path({ friend_id: addFriendshipBtn.data('friendId') }), 
/*			dataType: 'json', */
			type: 'POST',
			success: function(e){
				console.log("it worked!");
				addFriendshipBtn.hide();
			/* Append html using javascript, don't create html elements andthen hide elements with javascript,
			because if javascript is turned off, a random element will just be hanging there */	
				$('#friend-status').html("<a class='btn btn-success'> Friend Request Sent </a>");
   
			},
		    error: function(XMLHttpRequest, textStatus, errorThrown) { 
        		alert("Status: " + textStatus); alert("Error: " + errorThrown);
        		$('#friend-status').html("<a class='btn btn-danger'> Friend Request Could Not Be Sent </a>");
    		}    
		})
	});


}

$(document).ready(ready);
$(document).on('page:load', ready);