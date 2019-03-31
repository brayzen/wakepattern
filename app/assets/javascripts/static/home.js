$(window).load(function() {
  const hero_timeline = new TimelineMax();

  $('.hero_text').each(function(i, textElem){
    const timeline = new TimelineMax();
    timeline.add(TweenMax.to(textElem, .75, { top: '41%' }));
    timeline.add(TweenMax.to(textElem, 1, { top: '-100', delay: 1.5 }));
    return hero_timeline.add(timeline);
  });

  return hero_timeline.repeat(-1);
});

$('#how-it-works').click(function(){
	$('.how-it-works').show();
})
