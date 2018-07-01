$(window).load ->
  hero_timeline = new TimelineMax()

  $('.hero_text').each (i, textElem)->
    timeline = new TimelineMax()
    timeline.add TweenMax.to(textElem, .75, { top: '41%' })
    timeline.add TweenMax.to(textElem, .75, { top: '-100', delay: 1.25 })
    hero_timeline.add timeline

  hero_timeline.repeat -1

