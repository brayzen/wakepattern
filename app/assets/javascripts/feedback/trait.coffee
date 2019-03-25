Vue.component 'rait',
  props: ['trait']
  template: """
    <div class="trait" index='trait.indent'>
      <div class='trait_name'>
        {{trait.name}}
      </div>
      <div class='stars'>
        <star
          v-for="(star, index) in 5"
          v-bind:rating = "trait.rating"
          v-bind:index = "index"
          v-bind:key = "index"
        >
        </star>
      </div>
			<div class='trait_response'>
				<textarea>
					Why so?
				</textarea>
			</div>
    </div>
  """

