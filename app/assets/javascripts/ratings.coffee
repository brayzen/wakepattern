$ ->
  $('.star.rating').click ->
    $(this).parent().attr 'data-stars', $(this).data('rating')

  $('.group-0 .stars').click ->
    orderNum = $(this).parent().parent().parent().attr 'data-order'
    $(".group-#{orderNum}").show()
