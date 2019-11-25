# ユーザー
User.create!(name:  "ryuhei",
             email: "manchester.ryu.121@gmail.com",
             password:              "password",
             password_confirmation: "password",
             admin: true
             )

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               )
end


# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

25.times do |n|
  title  = Faker::Lorem.word
  des =  Faker::Lorem.word

  Category.create!(title:  title,
                  description: des)
end

20.times do |n|
  title = Faker::Name.unique.name
  description =  "Lorem Epsum"
  Category.create!(title: title,description: description)

  10.times do
    content = Faker::Lorem.word
    word = Category.all.sample.words.build content: content
    word.choices = [
      Choice.new(content: content, isCorrect: true),
      Choice.new(content: Faker::Music.instrument, isCorrect: false),
      Choice.new(content: Faker::Music.chord, isCorrect: false)
    ].shuffle
    word.save(validate: false)
  end
end



