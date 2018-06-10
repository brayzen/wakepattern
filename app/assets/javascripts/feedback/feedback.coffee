Vue.component 'feedback',
  props: ['feedback']
  template: """
    <div class='feedback'>
      <div class='head'>
        <h3 class='recipient'>
          To: {{ feedback.receiver.name }}
        </h3>

        <div class='date'>
          {{ feedback.created_at }}
        </div>
      </div>
      <div class="message">
        {{ feedback.message }}
      </div>

      <trait
        v-for = "(trait, index) in feedback.feedback_traits"
        v-bind:trait = "trait"
        v-bind:index = "index"
        v-bind:key = "index"
      >
      </trait>
    </div>
  """
