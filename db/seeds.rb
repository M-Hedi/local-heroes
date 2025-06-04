# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# if Rails.env.development?
puts "Deleting DB"
Store.destroy_all
User.destroy_all
Product.destroy_all
puts "DB cleaned"
# end

puts "Creating users"
10.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "test#{i}@mail.com",
    password: "password"
  )
end

puts "Created #{User.count} users"

puts "Request to API"

query = <<~OVERPASS
[out:json][timeout:25];
area["name"="Lille"]["admin_level"="8"]->.searchArea;
(
node["shop"="bakery"](area.searchArea);
way["shop"="bakery"](area.searchArea);
node["shop"="butcher"](area.searchArea);
way["shop"="butcher"](area.searchArea);
node["shop"="hardware"](area.searchArea);
way["shop"="hardware"](area.searchArea);
node["shop"="greengrocer"](area.searchArea);
way["shop"="greengrocer"](area.searchArea);
node["shop"="convenience"](area.searchArea);
way["shop"="convenience"](area.searchArea);
);
out body;
OVERPASS

response = Faraday.post('https://overpass-api.de/api/interpreter') do |req|
  req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
  req.body = URI.encode_www_form(data: query)
end

data = JSON.parse(response.body)
stores = data["elements"]

puts "Creating stores"
User.all.first(5).each do |user|
  store = stores.sample
  Store.create!(
    user: user,
    description: Faker::ChuckNorris.fact,
    name: store["tags"]["name"],
    category: store["tags"]["shop"],
    phone_number: Faker::PhoneNumber.cell_phone_in_e164
  )
end
puts "Created #{Store.count} stores"


puts "Creating products"

Store.find_each do |store|
  5.times do
    Product.create!(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price(range: 5..100.0),
      category: Faker::Commerce.department(max: 1, fixed_amount: true),
      discount: rand(0..30), # discount entre 0% et 30%
      stock: rand(1..50),
      loyalty_price: Faker::Commerce.price(range: 1..50.0),
      status: ['available', 'unavailable'].sample,
      desciption: Faker::Lorem.sentence(word_count: 10),
      store_id: store.id
    )
  end
end
puts "Created #{Product.count} stores"
