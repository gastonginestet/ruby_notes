# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do |i|
  user = User.create email: "User@user#{i}.com", username: "user#{i}", password: "user#{i}",
                     password_confirmation: "user#{i}"
  (1..5).each do |j|
    user.books.create title: "book#{j} from user#{i}"
  end
end
