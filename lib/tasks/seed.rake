namespace :seed do
  task traits: :environment do
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
    sender = User.new(name: 'Bender Rodriguez', password: 'fat dink', password_confirmation: 'fat dink', email: "Bender.Rodriguez@example.com")
    sender.save validate: false

    Feedback.create(Array.new(10).fill({})) do |f|
      fn = Faker::Name.first_name
      ln = Faker::Name.last_name
      receiver = User.new(name: "#{fn} #{ln}", password: 'iggy pop2222', password_confirmation: 'iggy pop2222', email: "#{fn}.#{ln}@example.com")
      receiver.save validate: false
      f.sender_id   = sender.id
      f.receiver_id = receiver.id
    end
  end
end
