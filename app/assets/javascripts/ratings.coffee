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
		
class @Traits
  constructor: (elem)->
    elem ||= '.traits'
    @elem = $(elem)
    @select_stars_handler()
    @stars_hover_handler()
    # @traits_hash()

  select_stars_handler: ->
    @elem.find('.rating_stars').click '.star', (e)->
      index = $(e.target).parents('.star').index() + 1
      $(@).find('.star').removeClass 'selected'
      $(@).find(".star:nth-child(-n + #{index})").addClass 'selected'

  stars_hover_handler: ->
    @elem.find('.trait .rating_stars').on 'mouseover', '.star', (e)->
      index = $(e.target).parents('.star').index() + 1
      $(@).parents('.rating_stars').find('.star').removeClass 'hover'
      $(@).parents('.rating_stars').find(".star:nth-child(-n + #{index})").addClass 'hover'

    @elem.find('.trait .rating_stars').on 'mouseout', (e)->
      $(@).find('.star').removeClass 'hover'

  # traits_hash: ->
  #   stars:

$ ->
  new Traits()
