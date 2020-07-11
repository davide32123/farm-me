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
10.times do
  params = {}
  params[:first_name] = Faker::Name.first_name
  params[:last_name] = Faker::Name.last_name
  params[:password] = "password"
  params[:email] = Faker::Internet.email
  params[:description] = Faker::Lorem.sentence
  params[:address] = Faker::Address.full_address
  new_user = User.new(params)
  new_user.save
  puts "Created user #{new_user.id}"
end
puts "Users created"

puts "Creating products"
10.times do
  new_product = Product.new(name: [Faker::Food.vegetables, Faker::Food.fruits].sample)
  new_product.save
  puts "Created product #{new_product.id}"
end
puts "Products created"

puts "Creating baskets"
10.times do
  params = {}
  params[:description] = Faker::Lorem.sentence
  params[:user] = User.all.sample
  params[:availability] = true
  params[:title] = Faker::Lorem.word
  params[:price] = rand(1000..99999)
  new_basket = Basket.new(params)
  new_basket.save
  puts "Created basket #{new_basket.id}"
end
puts "Baskets created"

puts "Creating basket items"
Basket.all.each do |basket|
  3.times do
    params = {}
    params[:basket] = basket
    params[:product] = Product.all.sample
    new_basket_item = BasketItem.create(params)
  end
  puts "Basket #{basket.id} filled"
end
puts "Created basket items"

puts "Creating subscriptions"
5.times do
  params = {}
  params[:user] = User.all.sample
  params[:basket] = Basket.all.sample
  params[:active] = true
  params[:status] = ["pending", "approved", "rejected"].sample
  params[:delivery_day] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"].sample
  new_subscription = Subscription.new(params)
  new_subscription.save
  puts "Created subscription #{new_subscription.id}"
end
puts "Created subscriptions"

