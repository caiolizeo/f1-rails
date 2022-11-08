# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
50.times do
  first_name = Faker::Name.first_name
  last_name  = Faker::Name.last_name
  user = User.new(email: Faker::Internet.safe_email(name:"#{first_name} #{last_name}"), 
               password: Faker::Internet.password(min_length: 6, max_length: 6, mix_case: false),
               username: Faker::Internet.username(specifier: "#{first_name} #{last_name}"),
               first_name: first_name,
               last_name: last_name)

  if user.save
    puts 'USER CREATED'
    puts "email:      #{user.email}"
    puts "First name: #{user.first_name}"
    puts "Last name:  #{user.last_name}"
    puts "Username:   #{user.username}"
    puts "Password:   #{user.password}"
    puts "======================================="
  end
end

#F1Driver.update
#F1Circuit.update