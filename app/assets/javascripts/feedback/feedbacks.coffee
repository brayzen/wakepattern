window.feedbacks_app = new Vue
  el: '#feedbacks'
  data:
    feedbacks: {}
    current_sort: null
    sort_asc: true

  methods:
    get_feedbacks: (type)->
      $.get "/feedbacks.json?type=#{type}"

    sort: (fields)->
      if @_data.current_sort == fields
        @_data.sort_asc = !@_data.sort_asc
      else
        @_data.current_sort = fields
        @_data.sort_asc = true

      fields = fields.split '.'
      @_data.feedbacks.sort (a, b)=>
        for field in fields
          a = a[field]
          b = b[field]
        if @_data.sort_asc
          return 1 if a > b
          return 0 if a == b
          return -1 if b > a
        else
          return 1 if a < b
          return 0 if a == b
          return -1 if b < a

$ ->
  $(document).on 'feedbacks_received', (e, data)=>
    window.feedbacks_app._data.feedbacks = JSON.parse data.feedbacks

  $.get '/feedbacks.json'
