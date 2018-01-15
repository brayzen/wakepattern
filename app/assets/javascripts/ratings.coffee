class @FeedbackTraits
  constructor: (elem)->
    elem ||= 'form.feedback_form .traits'
    @elem = $(elem)
    @select_stars_handler()
    @stars_hover_handler()

  select_stars_handler: ->
    @elem.find('.trait').click '.star', (e)->
      index = $(e.target).parents('.star').index() + 1
      $(@).find('.star').removeClass 'selected'
      $(@).find(".rating_stars .star:nth-child(-n + #{index})").addClass 'selected'
      $(@).find("input.input_rating").val index

  stars_hover_handler: ->
    @elem.find('.trait .rating_stars').on 'mouseover', '.star', (e)->
      index = $(e.target).parents('.star').index() + 1
      $(@).parents('.rating_stars').find('.star').removeClass 'hover'
      $(@).parents('.rating_stars').find(".star:nth-child(-n + #{index})").addClass 'hover'

    @elem.find('.trait .rating_stars').on 'mouseout', (e)->
      $(@).find('.star').removeClass 'hover'

$ ->
  new FeedbackTraits()
