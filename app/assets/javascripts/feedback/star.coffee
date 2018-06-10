window.star = Vue.component 'star',
  props: ['rating', 'index']
  methods:
    color: (rating, index)->
      index <= rating

  template: """
    <div v-bind:class="{ 'star': 'true', 'blue': color(rating, index) }">
      <svg height="25" width="23">
        <polygon points="9.9, 1.1, 3.3, 21.78, 19.8, 8.58, 0, 8.58, 16.5, 21.78"/>
      </svg>
    </div>
  """
