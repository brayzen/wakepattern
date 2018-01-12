// Feedback form

function clearForm(){
	$('#first-name').val('')	
	$('#last-name').val('')	
	$('#email').val('')	
	$('#message').val('')	
	$('#from-first-name').val('')
	$('#from-last-name').val('')
	$('#from-first-name').val('')
	$('#from-last-name').val('')
	$('.stars[name="rating-likable"]').data('stars', 5)
	$('.stars[name="rating-trustworthy"]').data('stars', 5)
}

function peekaboo(e){
	if (typeof element === 'string'){
		$(e).toggleClass('hide')	
	}
}

function hideOverlay(){
	console.log('yo ho ho');
	peekaboo('.overlay')	
}

function toggleOverlay(){
	console.log('toggling overlay');
	$('#form').toggleClass('overlay')
	$('#form').toggleClass('no-overlay')
	$('.close-out').toggleClass('hide')
}

$(function(){
	
	// made from Feedback compiler which should have been loaded ahead of fbFrom.js
	var fb = new FeedbackCompiler()	



///////////////////////////////////////////////f
///////////////////////////////////////////////f
///////////////////////////////////////////////f

						$('#button-fakeData').click(function(){
								$('#first-name').val('test')	
								$('#last-name').val('tester')	
								$('#email').val('test@example.com')	
								$('#message').val('This is your message')	
								$('#from-first-name').val('bob')
								$('#from-last-name').val('sender')
								$('.stars[name="rating-likable"]').data('stars', 4)
								$('.stars[name="rating-communication"]').data('stars', 3)
								$('.stars[name="rating-helpful"]').data('stars', 5)
						})	


///////////////////////////////////////////////f
///////////////////////////////////////////////f
///////////////////////////////////////////////f

	// Button to toggle anonymity
	$('#testimony-button, #anonymous-button').on('click', function(){
		console.log("heya");
		$('.testimony-display-1').toggleClass("hide");
		$('.testimony-display-2').toggleClass("hide");
	})

	// Read Reciept hide/show for signin button
	$('input:checkbox, #read-receipt').change(function(){
		if ($(this).is(':checked'))	{
			$('#button-signin').show()	
		} else {
			$('#button-signin').hide()	
		}
	})


	//Submit button send off
	$('#button-submit').click(function(){
	  var _peekaboo = peekaboo	
		fb.setData()
		fb.validateAll()
		fb.postFbToServer()
		.then(function(resData){
			console.log('testing:', resData);	
			clearForm()
			toggleOverlay()
		}).catch(function(data){
			console.log('failing data:', data);	
		})
	})

	//button to close form from x
	$('.close-out').click(function(){
		toggleOverlay()	
	})

})
