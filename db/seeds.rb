p 'fake user'
bender = User.create!(name: 'bender rodriguez', password: 'password', password_confirmation: 'password', email: "bender.rodriguez@example.com")

Rake::Task['seed:traits'].invoke
Rake::Task['seed:feedback:sent'].invoke bender.id
Rake::Task['seed:feedback:received'].invoke bender.id
