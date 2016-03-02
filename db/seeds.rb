# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed user
user1 = User.first_or_create!(email:"admin@admin.com", password: "124567890")
user2 = User.first_or_create!(email:"exemple@admin.com", password: "12345678")



# Seed agency
agency1 = Agency.first_or_create!(name:"Fullsix", user: user1)


review1 = Review.first_or_create!(description: " so good ", agency: agency1, user: user2)





