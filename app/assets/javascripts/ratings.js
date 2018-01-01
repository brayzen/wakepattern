$(function(){
	// Stars Thanks to Brian Knapp https://codepen.io/brianknapp/pen/JEotD/
	$('.star.rating').click(function(){
		$(this).parent().attr('data-stars', $(this).data('rating'));
	});

	//find the apporpriate group based on the order of the rating clicked. 
  $('.group-0 .stars').click(function(){
		var orderNum = $(this).parent().parent().parent().attr("class").match(/order-\d/)
		var query = '.group-' + parseInt(orderNum[0].slice(-1)).toString()
		console.log(query);
		$(query).show();
	})
	
})
