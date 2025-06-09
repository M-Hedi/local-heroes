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
EventProduct.destroy_all
EventPartner.destroy_all
Event.destroy_all
Item.destroy_all
Order.destroy_all
Product.destroy_all
Event.destroy_all
Store.destroy_all
User.destroy_all


puts "DB cleaned"
# end


# User 1
user1 = User.create!(
  first_name: "Louis",
  last_name: "Louis",
  email: "louis.durot@auptitlouis.fr",
  password: "password",
  address: "12 rue des Boulangers, 59000 Lille, France",
  phone_number: "06 52 18 43 97"
)

store1 = Store.create!(
  user: user1,
  description: "Au p’tit Louis est né en 2013 grâce à la complicité de deux anciens collègues partageant les mêmes valeurs : respect du produit, proximité avec le client et éco-responsabilité.",
  name: "Boulangerie Au P'tit Louis",
  category: "Boulangerie",
  phone_number: "0320921962",
  address: "5 Pl. de la Solidarité, 59000 Lille"
)

Product.create!(
  [
    {
      name: "Pain de seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store1
    },
    {
      name: "Pain au lait",
      price: 1.20,
      category: "Viennoiserie",
      discount: 0.05,
      stock: 40,
      loyalty_price: 50,
      status: ['available', 'unavailable'].sample,
      description: "Petit pain moelleux au lait, parfait pour le goûter ou le petit-déjeuner des enfants.",
      store: store1
    },
    {
      name: "Tartelette citron meringuée",
      price: 3.70,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 20,
      loyalty_price: 90,
      status: ['available', 'unavailable'].sample,
      description: "Pâte sablée croustillante garnie d'une crème au citron acidulée et d'une meringue légère.",
      store: store1
    },
    {
      name: "Pain aux olives",
      price: 2.80,
      category: "Pain",
      discount: 0.12,
      stock: 25,
      loyalty_price: 70,
      status: ['available', 'unavailable'].sample,
      description: "Pain moelleux agrémenté d'olives noires, parfait pour accompagner vos apéritifs et repas.",
      store: store1
    },
    # Produit ajouté pour store1
    {
      name: "Éclair au chocolat",
      price: 3.20,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 25,
      loyalty_price: 80,
      status: ['available', 'unavailable'].sample,
      description: "Pâte à choux légère garnie d'une crème au chocolat onctueuse, un classique indémodable.",
      store: store1
    }
  ]
)


# User 2
user2 = User.create!(
  first_name: "Marie",
  last_name: "Dupont",
  email: "marie.dupont@example.com",
  password: "password",
  address: "18 rue de Wazemmes, 59000 Lille, France",
  phone_number: "06 74 22 11 33"
)

store2 = Store.create!(
  user: user2,
  description: "La Maison Dupont, boulangerie artisanale fondée en 2010, privilégie le goût authentique et les produits locaux pour une qualité optimale.",
  name: "Maison Dupont",
  category: "Boulangerie",
  phone_number: "0320223344",
  address: "18 rue de Wazemmes, 59000 Lille"
)

Product.create!(
  [
    {
      name: "Pain de seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store2
    },
    {
      name: "Pain au lait",
      price: 1.20,
      category: "Viennoiserie",
      discount: 0.05,
      stock: 40,
      loyalty_price: 50,
      status: ['available', 'unavailable'].sample,
      description: "Petit pain moelleux au lait, parfait pour le goûter ou le petit-déjeuner des enfants.",
      store: store2
    },
    {
      name: "Tartelette citron meringuée",
      price: 3.70,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 20,
      loyalty_price: 90,
      status: ['available', 'unavailable'].sample,
      description: "Pâte sablée croustillante garnie d'une crème au citron acidulée et d'une meringue légère.",
      store: store2
    },
    {
      name: "Pain aux olives",
      price: 2.80,
      category: "Pain",
      discount: 0.12,
      stock: 25,
      loyalty_price: 70,
      status: ['available', 'unavailable'].sample,
      description: "Pain moelleux agrémenté d'olives noires, parfait pour accompagner vos apéritifs et repas.",
      store: store2
    },
    # Produit ajouté pour store2
    {
      name: "Éclair au chocolat",
      price: 3.20,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 25,
      loyalty_price: 80,
      status: ['available', 'unavailable'].sample,
      description: "Pâte à choux légère garnie d'une crème au chocolat onctueuse, un classique indémodable.",
      store: store2
    }
  ]
)


# User 3
user3 = User.create!(
  first_name: "Sophie",
  last_name: "Martin",
  email: "sophie.martin@example.com",
  password: "password",
  address: "22 rue de Flandre, 59000 Lille, France",
  phone_number: "06 78 99 88 77"
)

store3 = Store.create!(
  user: user3,
  description: "La Boulangerie Sophie allie tradition et modernité pour offrir à ses clients des produits frais et savoureux chaque jour.",
  name: "Boulangerie Sophie",
  category: "Boulangerie",
  phone_number: "0320456789",
  address: "22 rue de Flandre, 59000 Lille"
)

Product.create!(
  [
    {
      name: "Pain de seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store3
    },
    {
      name: "Pain au lait",
      price: 1.20,
      category: "Viennoiserie",
      discount: 0.05,
      stock: 40,
      loyalty_price: 50,
      status: ['available', 'unavailable'].sample,
      description: "Petit pain moelleux au lait, parfait pour le goûter ou le petit-déjeuner des enfants.",
      store: store3
    },
    {
      name: "Tartelette citron meringuée",
      price: 3.70,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 20,
      loyalty_price: 90,
      status: ['available', 'unavailable'].sample,
      description: "Pâte sablée croustillante garnie d'une crème au citron acidulée et d'une meringue légère.",
      store: store3
    },
    {
      name: "Pain aux olives",
      price: 2.80,
      category: "Pain",
      discount: 0.12,
      stock: 25,
      loyalty_price: 70,
      status: ['available', 'unavailable'].sample,
      description: "Pain moelleux agrémenté d'olives noires, parfait pour accompagner vos apéritifs et repas.",
      store: store3
    },
    # Produit ajouté pour store3
    {
      name: "Éclair au chocolat",
      price: 3.20,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 25,
      loyalty_price: 80,
      status: ['available', 'unavailable'].sample,
      description: "Pâte à choux légère garnie d'une crème au chocolat onctueuse, un classique indémodable.",
      store: store3
    }
  ]
)


# User 4

user4 = User.create!(
  first_name: "Ahmed",
  last_name: "Ben Ali",
  email: "ahmed.benali@example.com",
  password: "password",
  address: "18 rue de Wazemmes, 59000 Lille, France",
  phone_number: "06 70 22 33 44"
)

store4 = Store.create!(
  user: user4,
  description: "La Boulangerie Aziza, reconnue à Wazemmes pour ses produits frais et son savoir-faire traditionnel.",
  name: "Boulangerie Aziza",
  category: "Boulangerie",
  phone_number: "0320223344",
  address: "18 rue de Wazemmes, 59000 Lille"
)

Product.create!(
  [
    {
      name: "Pain de seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store4
    },
    {
      name: "Pain au lait",
      price: 1.20,
      category: "Viennoiserie",
      discount: 0.05,
      stock: 40,
      loyalty_price: 50,
      status: ['available', 'unavailable'].sample,
      description: "Petit pain moelleux au lait, parfait pour le goûter ou le petit-déjeuner des enfants.",
      store: store4
    },
    {
      name: "Tartelette citron meringuée",
      price: 3.70,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 20,
      loyalty_price: 90,
      status: ['available', 'unavailable'].sample,
      description: "Pâte sablée croustillante garnie d'une crème au citron acidulée et d'une meringue légère.",
      store: store4
    },
    {
      name: "Pain aux olives",
      price: 2.80,
      category: "Pain",
      discount: 0.12,
      stock: 25,
      loyalty_price: 70,
      status: ['available', 'unavailable'].sample,
      description: "Pain moelleux agrémenté d'olives noires, parfait pour accompagner vos apéritifs et repas.",
      store: store4
    },
    # Produit ajouté pour store4
    {
      name: "Éclair au chocolat",
      price: 3.20,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 25,
      loyalty_price: 80,
      status: ['available', 'unavailable'].sample,
      description: "Pâte à choux légère garnie d'une crème au chocolat onctueuse, un classique indémodable.",
      store: store4
    }
  ]
)


# User 5
user5 = User.create!(
  first_name: "Claire",
  last_name: "Legrand",
  email: "claire.legrand@example.com",
  password: "password",
  address: "14 rue des Arts, 59000 Lille, France",
  phone_number: "06 55 44 33 22"
)

store5 = Store.create!(
  user: user5,
  description: "La Boulangerie Legrand, depuis 2005, propose une large gamme de pains et pâtisseries faits maison, en alliant tradition et innovation.",
  name: "Boulangerie Legrand",
  category: "Boulangerie",
  phone_number: "0320554433",
  address: "14 rue des Arts, 59000 Lille"
)

Product.create!(
  [
    {
      name: "Pain de seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store5
    },
    {
      name: "Pain au lait",
      price: 1.20,
      category: "Viennoiserie",
      discount: 0.05,
      stock: 40,
      loyalty_price: 50,
      status: ['available', 'unavailable'].sample,
      description: "Petit pain moelleux au lait, parfait pour le goûter ou le petit-déjeuner des enfants.",
      store: store5
    },
    {
      name: "Tartelette citron meringuée",
      price: 3.70,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 20,
      loyalty_price: 90,
      status: ['available', 'unavailable'].sample,
      description: "Pâte sablée croustillante garnie d'une crème au citron acidulée et d'une meringue légère.",
      store: store5
    },
    {
      name: "Pain aux olives",
      price: 2.80,
      category: "Pain",
      discount: 0.12,
      stock: 25,
      loyalty_price: 70,
      status: ['available', 'unavailable'].sample,
      description: "Pain moelleux agrémenté d'olives noires, parfait pour accompagner vos apéritifs et repas.",
      store: store5
    },
    # Produit ajouté pour store5
    {
      name: "Éclair au chocolat",
      price: 3.20,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 25,
      loyalty_price: 80,
      status: ['available', 'unavailable'].sample,
      description: "Pâte",
      store: store5
      }
  ]
)


# 2 Events

Event.create!(
  store: store,
  title: "Fête du Pain – Dégustation gratuite",
  description: "À l'occasion de la fête du pain, la boulangerie Au p’tit Louis vous invite à une journée exceptionnelle de dégustation gratuite. Venez découvrir nos pains artisanaux faits maison avec des farines locales, nos viennoiseries pur beurre et nos brioches moelleuses. Des démonstrations de façonnage et de cuisson seront également proposées tout au long de la journée, pour petits et grands. Offres spéciales sur les produits du jour et surprises gourmandes garanties !",
  start_date: Date.today,
  end_date: Date.today + 1
)

Event.create!(
  store: store,
  title: "Atelier pâtisserie pour enfants",
  description: "La boulangerie Au p’tit Louis organise un atelier pâtisserie réservé aux enfants de 6 à 12 ans. Encadrés par notre chef pâtissier, les apprentis boulangers apprendront à préparer leur propre brioche et de délicieux petits sablés. L’objectif est de transmettre notre passion du fait maison tout en s’amusant ! Chaque participant repartira avec ses créations et un diplôme du petit pâtissier. Les places sont limitées, pensez à réserver rapidement pour cet événement gourmand et pédagogique.",
  start_date: Date.today + 7,
  end_date: Date.today + 8
)


# A rajouter une image par event via Cloudinary





puts "Creating users"
30.times do |i|
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
User.all.first(20).each do |user|
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
      description: Faker::Lorem.sentence(word_count: 10),
      store_id: store.id
    )
  end
end
puts "Created #{Product.count} products"

User.all.each do |user|
  Order.create!(
    user: user,
    status_store: ['pending', 'accepted', 'refused'].sample,
    status_customer: ['pending', 'validated', 'canceled'].sample,
    store_id: Store.all.sample.id
  )
end

puts "Created #{Order.count} orders"

Order.all.each do |order|
  Item.create!(
    order_id: order.id,
    product_id: order.store.products.sample.id,
    quantity: rand(1..10)
  )
end

puts "Created #{Item.count} items"

10.times do |e|
  Event.create!(
    store: Store.all.sample,
    title: Faker::Restaurant.name,
    description: Faker::JapaneseMedia::StudioGhibli.quote,
    start_date: Date.today,
    end_date: Date.today + 1
  )
end

puts "Created #{Event.count} events"

30.times do
  EventPartner.create!(
    store: Store.order("RANDOM()").first,
    event: Event.order("RANDOM()").first
  )
end

puts "Created #{EventPartner.count} event partners"

80.times do
  EventProduct.create!(
    product: Product.order("RANDOM()").first,
    event: Event.order("RANDOM()").first
  )
end

puts "Created #{EventProduct.count} event products"
