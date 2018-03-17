FactoryBot.define do
  f_name = Faker::Name.first_name
  l_name = Faker::Name.last_name
  factory :user do
    first_name f_name
    last_name l_name
    email Faker::Internet.safe_email "#{f_name} #{l_name}"
    handle l_name
    password 'password'
    password_confirmation 'password'
  end
end
