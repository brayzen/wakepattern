FactoryBot.define do
  factory :context do
    name { "MyString" }
    handle { "MyString" }
    default { false }
    user { nil }
  end
end
