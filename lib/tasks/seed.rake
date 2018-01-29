namespace :seed do
  task traits: :environment do
    p 'seeding traits'
    # hard set the id for consistency
    traits = Trait.create([
      { id: 1,  name: 'helpful',       order: 1,  indent: 0 },
      { id: 2,  name: 'dependable',    order: 2,  indent: 1 },
      { id: 3,  name: 'productive',    order: 3,  indent: 1 },
      { id: 4,  name: 'communication', order: 4,  indent: 0 },
      { id: 5,  name: 'listening',     order: 5,  indent: 1 },
      { id: 6,  name: 'speech',        order: 6,  indent: 1 },
      { id: 7,  name: 'understanding', order: 7,  indent: 1 },
      { id: 8,  name: 'charisma',      order: 8,  indent: 0 },
      { id: 9,  name: 'friendliness',  order: 9,  indent: 1 },
      { id: 10, name: 'composure',     order: 10, indent: 1 },
      { id: 11, name: 'complainer',    order: 11, indent: 1 }
    ])
  end

  task bender: :environment do
    p 'seeding bender'
    sender = User.create!(name: 'bender rodriguez', password: 'password', password_confirmation: 'password', email: "bender.rodriguez@example.com")

    Feedback.create(Array.new(10).fill({})) do |f|
      fn = Faker::Name.first_name.downcase
      ln = Faker::Name.last_name.downcase
      receiver = User.create!(name: "#{fn} #{ln}", password: 'password', password_confirmation: 'password', email: "#{fn}.#{ln}@example.com")
      f.sender_id   = sender.id
      f.receiver_id = receiver.id
    end
  end
end
