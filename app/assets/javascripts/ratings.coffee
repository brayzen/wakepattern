$ ->
  $('.traits .rating_stars').click '.star', (e)->
    index = $(e.target).parents('.star').index() + 1
    $(@).find('.star').removeClass 'selected'
    $(@).find(".star:nth-child(-n + #{index})").addClass 'selected'

  $('.traits .trait .rating_stars').on 'mouseover', '.star', (e)->
    index = $(e.target).parents('.star').index() + 1
    $(@).parents('.rating_stars').find('.star').removeClass 'hover'
    $(@).parents('.rating_stars').find(".star:nth-child(-n + #{index})").addClass 'hover'

  $('.traits .trait .rating_stars').on 'mouseout', (e)->
    $(@).find('.star').removeClass 'hover'
