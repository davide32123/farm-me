# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up start"
BasketItem.destroy_all
Subscription.destroy_all
Basket.destroy_all
Product.destroy_all
User.destroy_all
puts "Cleaning up done"

puts "Creating users"
params = {}
params[:first_name] = "Davide"
params[:last_name] = "Zanetto"
params[:password] = "password"
params[:email] = "davide.zanetto@farm-me.com"
params[:description] = "I love nature"
params[:address] = Faker::Address.full_address
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:first_name] = "Liam"
params[:last_name] = "Baker"
params[:password] = "password"
params[:email] = "liam.baker@farm-me.com"
params[:description] = "I love nature and coding"
params[:address] = Faker::Address.full_address
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:first_name] = "Ayako"
params[:last_name] = "Amano"
params[:password] = "password"
params[:email] = "ayako.amano@farm-me.com"
params[:description] = "I love coding"
params[:address] = Faker::Address.full_address
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

params = {}
params[:first_name] = "Cassiano"
params[:last_name] = "Yasumitsu"
params[:password] = "password"
params[:email] = "cassiano.yasumitsu@farm-me.com"
params[:description] = "I love coding"
params[:address] = Faker::Address.full_address
new_user = User.new(params)
new_user.save
puts "Created user #{new_user.id}"

puts "Users created"

puts "Creating products"
products = ["carrots", "apples", "zucchini", "potatoes", "grapes", "watermelon", "lemon", "tomatoes" ]
products.each do |product|
  new_product = Product.new(name: product)
  new_product.save
  puts "Created product #{new_product.id}"
end
puts "Products created"

puts "Creating baskets"
params = {}
params[:description] = "Too good to be true, a collection of tasty vegetables and fruits"
params[:user] = User.find_by(first_name: 'Davide')
params[:availability] = true
params[:title] = "Seasonal delights"
params[:price] = rand(1000..99999)
new_basket = Basket.new(params)
new_basket.save
puts "Created basket #{new_basket.id}"

params = {}
params[:description] = "Get your round, delicious veges"
params[:user] = User.find_by(first_name: 'Liam')
params[:availability] = true
params[:title] = "Voluptuous Vegetables"
params[:price] = rand(1000..99999)
new_basket = Basket.new(params)
new_basket.save
puts "Created basket #{new_basket.id}"

params = {}
params[:description] = "Yummy yummy yummy"
params[:user] = User.find_by(first_name: 'Ayako')
params[:availability] = true
params[:title] = "The good deal"
params[:price] = rand(1000..99999)
new_basket = Basket.new(params)
new_basket.save
puts "Created basket #{new_basket.id}"

params = {}
params[:description] = "The best vegetables in town"
params[:user] = User.find_by(first_name: 'Cassiano')
params[:availability] = true
params[:title] = "Vigorous Veges"
params[:price] = rand(1000..99999)
new_basket = Basket.new(params)
new_basket.save
puts "Created basket #{new_basket.id}"

params = {}
params[:description] = "Enjoy some exotic fruits"
params[:user] = User.find_by(first_name: 'Davide')
params[:availability] = true
params[:title] = "Frisky Fruits"
params[:price] = rand(1000..99999)
new_basket = Basket.new(params)
new_basket.save
puts "Created basket #{new_basket.id}"

params = {}
params[:description] = "Do you like fruits that will liven your life?"
params[:user] = User.find_by(first_name: 'Liam')
params[:availability] = true
params[:title] = "Funky Fruits"
params[:price] = rand(1000..99999)
new_basket = Basket.new(params)
new_basket.save
puts "Created basket #{new_basket.id}"

params = {}
params[:description] = "We really hope you would enjoy our delicious fruits"
params[:user] = User.find_by(first_name: 'Ayako')
params[:availability] = true
params[:title] = "Fresh Fruits"
params[:price] = rand(1000..99999)
new_basket = Basket.new(params)
new_basket.save
puts "Created basket #{new_basket.id}"

params = {}
params[:description] = "Enjoy the best selection of fruits and vegetables you can buy"
params[:user] = User.find_by(first_name: 'Cassiano')
params[:availability] = true
params[:title] = "Super Fruits and Veg"
params[:price] = rand(1000..99999)
new_basket = Basket.new(params)
new_basket.save
puts "Created basket #{new_basket.id}"

puts "Baskets created"

puts "Creating basket items"
Basket.all.each do |basket|
  3.times do
    params = {}
    params[:basket] = basket
    params[:product] = Product.all.sample
    params[:quantity] = rand(1..10)
    new_basket_item = BasketItem.create(params)
    puts "Basket item #{new_basket_item.id} done"
  end
  puts "Basket #{basket.id} filled"
end
puts "Created basket items"

puts "Creating subscriptions"

params = {}
params[:user] = User.find_by(first_name: 'Davide')
params[:basket] = Basket.find_by(title: "Voluptuous Vegetables")
params[:active] = true
params[:status] = "pending"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Davide')
params[:basket] = Basket.find_by(title: "Vigorous Veges")
params[:active] = true
params[:status] = "pending"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Liam')
params[:basket] = Basket.find_by(title: "Seasonal delights")
params[:active] = true
params[:status] = "pending"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Liam')
params[:basket] = Basket.find_by(title: "Vigorous Veges")
params[:active] = true
params[:status] = "pending"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Ayako')
params[:basket] = Basket.find_by(title: "Vigorous Veges")
params[:active] = true
params[:status] = "pending"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Ayako')
params[:basket] = Basket.find_by(title: "Seasonal delights")
params[:active] = true
params[:status] = "pending"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Cassiano')
params[:basket] = Basket.find_by(title: "Voluptuous Vegetables")
params[:active] = true
params[:status] = "pending"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Cassiano')
params[:basket] = Basket.find_by(title: "The good deal")
params[:active] = true
params[:status] = "pending"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Davide')
params[:basket] = Basket.find_by(title: "Funky Fruits")
params[:active] = true
params[:status] = "accepted"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Davide')
params[:basket] = Basket.find_by(title: "The good deal")
params[:active] = true
params[:status] = "rejected"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Liam')
params[:basket] = Basket.find_by(title: "Frisky Fruits")
params[:active] = true
params[:status] = "accepted"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Liam')
params[:basket] = Basket.find_by(title: "Super Fruits and Veg")
params[:active] = true
params[:status] = "rejected"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Ayako')
params[:basket] = Basket.find_by(title: "Super Fruits and Veg")
params[:active] = true
params[:status] = "accepted"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Ayako')
params[:basket] = Basket.find_by(title: "Frisky Fruits")
params[:active] = true
params[:status] = "rejected"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Cassiano')
params[:basket] = Basket.find_by(title: "Fresh Fruits")
params[:active] = true
params[:status] = "accepted"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"

params = {}
params[:user] = User.find_by(first_name: 'Cassiano')
params[:basket] = Basket.find_by(title: "Frisky Fruits")
params[:active] = true
params[:status] = "rejected"
params[:delivery_day] = Subscription.allowed_delivery_days.sample
new_subscription = Subscription.new(params)
new_subscription.save
puts "Created subscription #{new_subscription.id}"


puts "Created subscriptions"

