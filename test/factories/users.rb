FactoryBot.define do
  f_name = Faker::Name.first_name
  l_name = Faker::Name.last_name

  factory :user do
    password 'password'
    password_confirmation 'password'

    factory :sender do
      first_name 'sender'
      last_name 'rodriguez'
      email Faker::Internet.safe_email "sender rodriguez"
      handle 'rodriguez'
    end

    factory :receiver do
      first_name 'amy'
      last_name 'wong'
      email Faker::Internet.safe_email "amy wong"
      handle 'wong'
    end
  end
end
