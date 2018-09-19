Vue.component 'feedback',
  props: ['feedback']
  data: ->
      return {
        cfeedback: Object.assign(
          {},
          this.feedback,
          {created_at: window.localStamp(this.feedback.created_at)}
        )
      }
  template: """
    <div class='feedback'>
      <div class='head'>
        <h3 class='recipient'>
          {{ '@' + feedback.receiver.handle }}
        </h3>

        <div class='stamp'>
          {{ cfeedback.created_at }}
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
