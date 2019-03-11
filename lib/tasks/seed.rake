namespace :seed do
  task auth_provider: :environment do
    AuthenticationProvider.first_or_create name: 'facebook'
  end

  task questions: :environment do
    return if Question.where(text: 'On a scale of 1-10 rank my trustworthiness').present?
    brian = User.where(first_name: 'Brian', last_name: 'Ray').first
    brian ||= User.create first_name: 'Brian', last_name: 'Ray', email: 'brian.ray.biz@gmail.com', handle: 'brayzen', password: 'dingle_berry'
    [
      "On a scale of 1-10 rank my trustworthiness",
      "On a scale of 1-10 rank my appearance",
      "On a scale of 1-10 rank my communication",
      "Brian was being _______?",
      "What feedback could you give me to make me more effective",
      "How likely are you to use Wake Pattern for yourself",
      "How well did you understand what Wake Pattern is about?",
      "What feedback could you give me to make Wake Pattern more effective?"
    ].each_with_index do |q, i|
      puts "creating questions: ", q
      question = brian.questions.create text: q
    end
  end

  task traits: :environment do
    p 'seeding traits'
    # hard set the id for consistency
    traits = Trait.create([
      { id: 1,  name: 'communication', order: 1,  indent: 0 },
      { id: 2,  name: 'listening',     order: 2,  indent: 1 },
      { id: 3,  name: 'speaking',      order: 3,  indent: 1 },
      { id: 4,  name: 'character',     order: 4,  indent: 0 },
      { id: 5,  name: 'authenticity',  order: 5,  indent: 1 },
      { id: 6,  name: 'intention',     order: 6,  indent: 1 },
      { id: 7,  name: 'productive',    order: 7,  indent: 0 },
      { id: 8,  name: 'responsible',   order: 8,  indent: 1 },
      { id: 9,  name: 'dependable',    order: 9,  indent: 1 },
      { id: 10, name: 'effective',     order: 10, indent: 1 },
      { id: 11, name: 'likability',    order: 11, indent: 0 },
      { id: 12, name: 'compassion',    order: 12, indent: 1 },
      { id: 13, name: 'composure',     order: 13, indent: 1 },
    ])
  end

  task :user, [:first, :last] => [:environment] do
    user = User.create!(first_name: args[:first], last_name: args[:last], password: 'password', password_confirmation: 'password', email: "#{args[:first]}.#{args[:last]}@example.com")
    p "created user: ", user
  end

  namespace :feedback do
    task :lots, [:count] => [:environment] do |t, args|
      (2..100).each do |id|
        p "Seeding feedback for #{User.find(id).name}"
        p args[:count]
        # Rake::Task["seed:feedback:sent"].invoke id, args[:count]
        sh "rake seed:feedback:sent[#{id},#{args[:count]}]"
        # Rake::Task["seed:feedback:received"].invoke id, args[:count]
        sh "rake seed:feedback:received[#{id},#{args[:count]}]"
      end
    end

    task :sent, [:id, :count] => [:environment] do |t, args|
      sender = User.find args[:id]
      p "seeding sent for #{sender.first_name} #{sender.last_name}"

      Feedback.create(Array.new(args[:count].to_i){ {} }) do |f|
        receiver = fake_user
        fake_feedback f, sender.id, receiver.id
      end
    end

    task :received, [:id, :count] => [:environment] do |t, args|
      receiver = User.find args[:id]
      p "seeding received for #{receiver.first_name} #{receiver.last_name}"
      Feedback.create(Array.new(args[:count].to_i){ {} }) do |f|
        sender = fake_user
        fake_feedback f, sender.id, receiver.id
      end
    end

    def fake_user
      fn = Faker::Name.first_name.downcase
      ln = Faker::Name.last_name.downcase
      email = "#{fn}.#{ln}@example.com"
      if User.exists? email: email
        user = User.find_by email: email
        p "found a common user #{user.name}"
        return user
      end

      User.create!({
        first_name: fn,
        last_name: ln,
        password: 'password',
        password_confirmation: 'password',
        email: email,
        handle: "#{fn}-#{ln}#{rand(100)}"
      })
    end

    def fake_feedback(f, sender_id, receiver_id)
      f.message = Faker::Lorem.paragraph 2, false, 3
      f.sender_id = sender_id
      f.receiver_id = receiver_id
      f.feedback_traits = Array.new(rand(1..7)){ fake_feedback_trait }
      f.created_at = Faker::Date.between 2.months.ago, 1.day.ago
    end

    def fake_feedback_trait
      FeedbackTrait.new(rating: rand(1..5), trait_id: Trait.all.sample.id)
    end
  end
end


