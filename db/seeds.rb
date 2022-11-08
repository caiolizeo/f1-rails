# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

F1Driver.update
F1Circuit.update

driver_codes = []

F1Driver.all.each do |driver|
  driver_codes << driver.code
end

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
    puts "Password:   #{user.password}\n\n"
  end

  driver_codes = driver_codes.shuffle
  bet = Bet.new(user: user,
                circuit: F1Circuit.last_race.code,
                year: F1Circuit.last_race.year,
                pole: driver_codes[0],
                first: driver_codes[1],
                second: driver_codes[2],
                third: driver_codes[3],
                fourth: driver_codes[4],
                fifth: driver_codes[5],
                sixth: driver_codes[6],
                seventh: driver_codes[7],
                eighth: driver_codes[8],
                ninth: driver_codes[9],
                tenth: driver_codes[10],
                result_points: nil,
                validated: "invalidated")

  if bet.save
    puts "Bet created for user #{user.username}"
    puts "======================================="
  end

end

Bet.update_all