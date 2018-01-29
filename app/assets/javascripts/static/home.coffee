$ ->
  $('.slider:nth-child(1)').addClass('slide')
  setTimeout (-> $('.slider:nth-child(2)').addClass('slide')), 1500
  setTimeout (-> $('.slider:nth-child(3)').addClass('slide')), 3000
  setTimeout (-> $('.slider:nth-child(4)').addClass('slide')), 4500
