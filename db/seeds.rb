AuthenticationProvider.create name: 'facebook'

p 'creating bender'
bender = User.create!({
  first_name: 'bender',
  last_name: 'rodriguez',
  password: 'password',
  password_confirmation: 'password',
  email: "bender.rodriguez@example.com",
  handle: 'bender'
})

Rake::Task['seed:traits'].invoke
Rake::Task['seed:feedback:sent'].invoke bender.id
Rake::Task['seed:feedback:received'].invoke bender.id
