

/*$(document).ready ->
  $('.delete-comment').on 'ajax:success', -> 
   $(this).closest('div').fadeOut()
   return
*/
$(document).ready(function(){

  // Binds handler for ajax:success to existing (when document ready) elements
  // with class delete-comment
	// $('.delete-comment').on('ajax:success',function() {....});

  // ... to existing and NEW elements added dynamically ....
	$(document).on('ajax:success', '.delete-comment', function(){
		// this basically handles the response from server when a comment is deleted
		$(this).closest('div').fadeOut();
	});

});


/*$(document).ready(function(){
	$('.delete-comment').on('ajax:success', function(event, data){
	  console.log("ajax:success is being fired");
		$(this).closest('div').html(data);
	});
});*/