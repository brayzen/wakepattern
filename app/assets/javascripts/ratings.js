/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
this.FeedbackTraits = class FeedbackTraits {
  constructor(elem){
    if (!elem) { elem = 'form.feedback_form .traits'; }
    this.elem = $(elem);
    this.select_stars_handler();
    this.stars_hover_handler();
    this.$traits = $('li.trait')
		this.display_response_box;
		this.hide_indents()
  }

	hide_indents() {
		var traits = $('li.trait')
		var length = traits.length
		for (var i=0; i < length; i++) {
			 if (traits[i].getAttribute('data-indent') > 0) {
				 traits[i].style.display = 'none'
			 }			
		}
	}

  select_stars_handler() {
    return this.elem.find('.trait').click('.star', function(e){
			display_response_box(this)
			display_sub_traits(this)
      const index = $(e.target).parents('.star').index() + 1;
      $(this).find('.star').removeClass('selected');
      $(this).find(`.rating_stars .star:nth-child(-n + ${index})`).addClass('selected');
      $(this).find("input.input_rating").val(index);
      return $(this).find("input.input_rating").val(index);
    });
		
		function display_sub_traits(e){
    	var $traits = $('li.trait')
			var length = $traits.length
			var flag = false
			for (var i=0; i < length; i++) {
			  if ($traits[i].getAttribute('data-name') === $(e).attr('data-name')) {
					flag = true
				  continue	
				}
				if (flag === true){
					if ($traits[i].getAttribute('data-indent') > 0) {
						$traits[i].style.display = ''
					} else {
					  break	
					}
				}
			}
		}
		
		function display_response_box(e) {
			if ($(e).attr('data-indent') > 0) {
				$(e).next().show()
			}
		}
  }

  stars_hover_handler() {
    this.elem.find('.trait .rating_stars').on('mouseover', '.star', function(e){
      const index = $(e.target).parents('.star').index() + 1;
      $(this).parents('.rating_stars').find('.star').removeClass('hover');
      return $(this).parents('.rating_stars').find(`.star:nth-child(-n + ${index})`).addClass('hover');
   });

    return this.elem.find('.trait .rating_stars').on('mouseout', function(e){
      return $(this).find('.star').removeClass('hover');
    });
  }
};

$(() => new FeedbackTraits());
