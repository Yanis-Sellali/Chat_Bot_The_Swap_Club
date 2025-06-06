# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
User.destroy_all
Jersey.destroy_all


user1 = User.create!(
name: "David B",
email: "david.b@example.com",
password: "password",
address: "Paris"
)

user2 = User.create!(
name: "Clarence S",
email: "clarence@example.com",
password: "password",
address: "Milan"
)


#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
