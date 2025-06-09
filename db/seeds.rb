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
  store: store1,
  title: "Fête du Pain – Dégustation gratuite",
  description: "À l'occasion de la fête du pain, la boulangerie Au p’tit Louis vous invite à une journée exceptionnelle de dégustation gratuite. Venez découvrir nos pains artisanaux faits maison avec des farines locales, nos viennoiseries pur beurre et nos brioches moelleuses. Des démonstrations de façonnage et de cuisson seront également proposées tout au long de la journée, pour petits et grands. Offres spéciales sur les produits du jour et surprises gourmandes garanties !",
  start_date: Date.today,
  end_date: Date.today + 1
)

Event.create!(
  store: store2,
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


user_edouard = User.create!(
  first_name: "Edouard",
  last_name: "Baer",
  email: "edouard.baer@hotmail.com",
  password: "password",
  address: "1-31 Rue Colbert, 59800 Lille", #A jouter un addresse au modéle user
  phone_number: "0320334987" #A jouter un phone number au modéle user
)
user_sophie = User.create!(
  first_name: "Sophie",
  last_name: "Lemoine",
  email: "sophie.lemoine@gmail.com",
  password: "password",
  address: "45 Rue de Wazemmes, 59000 Lille",
  phone_number: "0320457863"
)
user_rachid = User.create!(
  first_name: "Rachid",
  last_name: "Benali",
  email: "rachid.benali@yahoo.fr",
  password: "password",
  address: "12 Rue d’Iéna, 59000 Lille",
  phone_number: "0320765472"
)
user_thomas = User.create!(
  first_name: "Thomas",
  last_name: "Nguyen",
  email: "thomas.nguyen@gmail.com",
  password: "password",
  address: "19 Rue Gambetta, 59000 Lille",
  phone_number: "0320679832"
)
user_claire = User.create!(
  first_name: "Claire",
  last_name: "Dubois",
  email: "claire.dubois@orange.fr",
  password: "password",
  address: "8 Rue des Sarrazins, 59000 Lille",
  phone_number: "0320884455"
)

store_1 = Store.create!(
  user: user_claire,
  description: "Poissonnerie iconique à Wazemmes, sel et savoir-faire familial, poissons et fruits de mer ultra‑frais, pêche durable et traiteur local. réunion.",
  name: "Le Petit Mousse",
  category: "Poissonnerie",
  phone_number: "0320545506",
  address:"396 Rue Léon Gambetta, 59000 Lille" #A jouter un addresse au modéle store
)

store_2 = Store.create!(
  user: user_thomas,
  description: "Poissonnerie du marché de Wazemmes, offre poissons frais et fruits de mer variés, ambiance conviviale, service expert et tarif correct.",
  name: "Poissonnerie La Marée",
  category: "Poissonnerie",
  phone_number: "0320679832",
  address: "78 Rue Jules Guesde, 59000 Lille" #A jouter un addresse au modéle store
)

store_3 = Store.create!(
  user: user_rachid,
  description: "Poissonnerie “La Bonne Pêche” aux Halles de Wazemmes : poissons & fruits de mer de Boulogne, fraîcheur quotidienne, service convivial.",
  name: "La bonne pêche",
  category: "Poissonnerie",
  phone_number: "0602319656",
  address: "25 Pl. Nouvelle Aventure, 59000 Lille" #A jouter un addresse au modéle store
)

store_4 = Store.create!(
  user: user_sophie,
  description: "Poissonnerie de Wazemmes, poissons frais du jour, crustacés variés et accueil chaleureux. Qualité et conseils personnalisés garantis.",
  name: "Au Petit Poissonnier",
  category: "Poissonnerie",
  phone_number: "0320429750",
  address: "25 Pl. Nouvelle Aventure, 59000 Lille" #A jouter un addresse au modéle store
)

store_5 = Store.create!(
  user: user_edouard,
  description: "Au Petit Poissonnier",
  name: "The Shark Poissonnerie",
  category: "Poissonnerie",
  phone_number: "0644176887",
  address: "325 Av. de Dunkerque, 59160 Lille" #A jouter un addresse au modéle store
)
# Cloudinary à installer pour les images seed
Product.create!(
  name: "Saumon atlantique frais",
  price: 24.90,
  category: "Poisson frais",
  discount: 22.41,
  stock: 15,
  loyalty_price: 22,
  status: "available",
  description: "Saumon atlantique d'élevage responsable, chair tendre et savoureuse. Idéal grillé, en papillote ou fumé maison. Riche en oméga-3.",
  store: store_1
)

Product.create!(
  name: "Crevettes roses cuites",
  price: 18.50,
  category: "Crustacés",
  discount: 16.65,
  stock: 25,
  loyalty_price: 16,
  status: "unavailable",
  description: "Crevettes roses de Méditerranée, cuites à la perfection. Chair ferme et goût iodé authentique. Parfaites pour vos plateaux de fruits de mer.",
  store: store_1
)

Product.create!(
  name: "Filets de sole meunière",
  price: 32.80,
  category: "Poisson frais",
  discount: 29.52,
  stock: 8,
  loyalty_price: 30,
  status: "available",
  description: "Filets de sole fraîche, chair délicate et fondante. Poisson noble parfait pour une cuisson meunière traditionnelle ou à la vapeur douce.",
  store: store_1
)

Product.create!(
  name: "Huîtres spéciales n°3",
  price: 15.90,
  category: "Mollusques",
  discount: 14.31,
  stock: 40,
  loyalty_price: 14,
  status: "available",
  description: "Huîtres spéciales calibre 3, chair charnue et goût marin prononcé. Élevées en Bretagne, parfaites nature avec un trait de citron.",
  store: store_1
)

Product.create!(
  name: "Thon rouge en tranches",
  price: 45.00,
  category: "Poisson frais",
  discount: 40.50,
  stock: 6,
  loyalty_price: 42,
  status: "unavailable",
  description: "Thon rouge de ligne, chair rouge intense et texture fondante. Qualité sashimi, idéal cru en tartare ou mi-cuit à la plancha.",
  store: store_1
)

Product.create!(
  name: "Moules de bouchot",
  price: 3.80,
  category: "Mollusques",
  discount: 3.42,
  stock: 60,
  loyalty_price: 3,
  status: "available",
  description: "Moules de bouchot de la baie du Mont-Saint-Michel. Chair orange généreuse, goût subtil. Parfaites marinières ou à la crème.",
  store: store_2
)

Product.create!(
  name: "Langoustines bretonnes",
  price: 28.90,
  category: "Crustacés",
  discount: 26.01,
  stock: 12,
  loyalty_price: 26,
  status: "available",
  description: "Langoustines fraîches de Bretagne, chair sucrée et délicate. Cuisson rapide recommandée pour préserver leur texture exceptionnelle.",
  store: store_2
)

Product.create!(
  name: "Cabillaud de ligne",
  price: 19.50,
  category: "Poisson frais",
  discount: 17.55,
  stock: 20,
  loyalty_price: 18,
  status: "unavailable",
  description: "Cabillaud pêché à la ligne, chair blanche ferme et floconneuse. Poisson polyvalent excellent en brandade, grillé ou en sauce.",
  store: store_2
)

Product.create!(
  name: "Saint-Jacques avec corail",
  price: 42.50,
  category: "Mollusques",
  discount: 38.25,
  stock: 18,
  loyalty_price: 39,
  status: "available",
  description: "Coquilles Saint-Jacques fraîches avec corail, pêche française. Chair nacrée et corail orange vif. Parfaites poêlées ou gratinées.",
  store: store_2
)

Product.create!(
  name: "Sardines de Méditerranée",
  price: 8.90,
  category: "Poisson frais",
  discount: 8.01,
  stock: 35,
  loyalty_price: 7,
  status: "available",
  description: "Sardines fraîches de Méditerranée, chair grasse et savoureuse. Riches en oméga-3, excellentes grillées au barbecue ou marinées.",
  store: store_2
)

Product.create!(
  name: "Homard breton vivant",
  price: 65.00,
  category: "Crustacés",
  discount: 58.50,
  stock: 4,
  loyalty_price: 60,
  status: "unavailable",
  description: "Homard breton vivant, chair ferme et goût authentique. Animal noble pour vos grandes occasions, cuisson vapeur ou thermidor recommandée.",
  store: store_3
)

Product.create!(
  name: "Dorade royale portion",
  price: 16.80,
  category: "Poisson frais",
  discount: 15.12,
  stock: 22,
  loyalty_price: 15,
  status: "available",
  description: "Dorade royale d'élevage méditerranéen, chair blanche délicate. Poisson fin parfait au four avec herbes de Provence ou en papillote.",
  store: store_3
)

Product.create!(
  name: "Bulots cuits nature",
  price: 12.40,
  category: "Mollusques",
  discount: 11.16,
  stock: 30,
  loyalty_price: 11,
  status: "available",
  description: "Bulots cuits à l'eau de mer, chair ferme et goût iodé prononcé. Parfaits à l'apéritif avec mayonnaise à l'ail ou en salade de mer.",
  store: store_3
)

Product.create!(
  name: "Turbot sauvage tranche",
  price: 38.90,
  category: "Poisson frais",
  discount: 35.01,
  stock: 7,
  loyalty_price: 36,
  status: "unavailable",
  description: "Turbot sauvage de ligne, chair ferme et délicate. Poisson noble aux saveurs subtiles, excellent au four ou poché au court-bouillon.",
  store: store_3
)

Product.create!(
  name: "Plateau de fruits de mer",
  price: 85.00,
  category: "Plateau composé",
  discount: 76.50,
  stock: 3,
  loyalty_price: 78,
  status: "available",
  description: "Plateau composé pour 4 personnes : huîtres, crevettes, bulots, tourteau, langoustines. Fraîcheur garantie, accompagné de pain de seigle.",
  store: store_3
)

Product.create!(
  name: "Merlan entier vidé",
  price: 11.20,
  category: "Poisson frais",
  discount: 10.08,
  stock: 28,
  loyalty_price: 10,
  status: "available",
  description: "Merlan frais de pêche locale, chair blanche et tendre. Poisson économique parfait frit, au four ou en soupe de poisson traditionnelle.",
  store: store_4
)

Product.create!(
  name: "Tourteau cuit entier",
  price: 22.30,
  category: "Crustacés",
  discount: 20.07,
  stock: 16,
  loyalty_price: 20,
  status: "unavailable",
  description: "Tourteau cuit de Bretagne, chair blanche généreuse dans les pattes et brune dans le coffre. Idéal nature ou en rillettes maison.",
  store: store_4
)

Product.create!(
  name: "Rouget-barbet de roche",
  price: 26.50,
  category: "Poisson frais",
  discount: 23.85,
  stock: 14,
  loyalty_price: 24,
  status: "available",
  description: "Rouget-barbet de petite pêche, chair fine au goût délicat. Poisson méditerranéen authentique, excellent grillé avec fenouil sauvage.",
  store: store_4
)

Product.create!(
  name: "Encornets frais nettoyés",
  price: 14.70,
  category: "Céphalopodes",
  discount: 13.23,
  stock: 25,
  loyalty_price: 13,
  status: "available",
  description: "Encornets frais de Méditerranée, nettoyés et prêts à cuisiner. Chair tendre si cuisson rapide. Parfaits à la plancha ou farcis.",
  store: store_4
)

Product.create!(
  name: "Filets de maquereau",
  price: 9.80,
  category: "Poisson frais",
  discount: 8.82,
  stock: 32,
  loyalty_price: 8,
  status: "unavailable",
  description: "Filets de maquereau frais, chair grasse riche en oméga-3. Poisson de saison aux saveurs prononcées, excellent mariné ou grillé.",
  store: store_4
)

Product.create!(
  name: "Palourdes grises",
  price: 13.60,
  category: "Mollusques",
  discount: 12.24,
  stock: 24,
  loyalty_price: 12,
  status: "available",
  description: "Palourdes grises de l'Atlantique, chair ferme et goût iodé authentique. Parfaites nature, farcies ou dans un risotto aux fruits de mer.",
  store: store_5
)

Product.create!(
  name: "Lotte en médaillons",
  price: 29.90,
  category: "Poisson frais",
  discount: 26.91,
  stock: 11,
  loyalty_price: 27,
  status: "available",
  description: "Médaillons de lotte fraîche, chair ferme sans arêtes. Texture similaire au homard, excellente en blanquette ou rôtie au four.",
  store: store_5
)

Product.create!(
  name: "Étrilles vivantes",
  price: 8.50,
  category: "Crustacés",
  discount: 7.65,
  stock: 45,
  loyalty_price: 7,
  status: "unavailable",
  description: "Étrilles vivantes de Bretagne, petits crabes pleins de saveur. Chair délicate dans les pattes, parfaites en bisque ou à la nage.",
  store: store_5
)

Product.create!(
  name: "Bar de ligne portion",
  price: 21.40,
  category: "Poisson frais",
  discount: 19.26,
  stock: 19,
  loyalty_price: 19,
  status: "available",
  description: "Bar de ligne sauvage, chair blanche ferme et délicate. Poisson noble de nos côtes, excellent au gros sel, grillé ou en croûte.",
  store: store_5
)

Product.create!(
  name: "Soupe de poisson artisanale",
  price: 7.90,
  category: "Préparation",
  discount: 7.11,
  stock: 15,
  loyalty_price: 7,
  status: "available",
  description: "Soupe de poisson artisanale préparée avec poissons de roche. Goût authentique méditerranéen, servir avec rouille et croûtons.",
  store: store_5
)

Event.create!(
  store: store_1,
  title: "Festival du Poisson Frais à Wazemmes",
  description: "Au cœur de l’été, Au Petit Poissonnier vous invite à découvrir la richesse des produits de la mer à travers un festival local dédié au goût et à la fraîcheur. Au programme : dégustations gratuites de poissons grillés, stand de fruits de mer, conseils de conservation et démonstrations de filetage. Une occasion unique d’échanger avec des artisans passionnés, de profiter d’offres spéciales et de célébrer les savoir-faire du quartier de Wazemmes dans une ambiance festive et chaleureuse.",
  start_date: Date.new(2025, 7, 19),
  end_date: Date.new(2025, 7, 21)
)

Event.create!(
  store: Store.find_by(name: "Poissonnerie La Marée"),
  title: "Marché Gourmand des Marées",
  description: "La Poissonnerie La Marée organise un marché gourmand exceptionnel à Wazemmes pour célébrer les produits frais de la mer. Venez rencontrer nos producteurs partenaires, découvrir notre sélection de poissons de saison, déguster des spécialités locales préparées sur place, et bénéficier de conseils pour cuisiner comme un chef. En plus : animations pour enfants, tombola fruits de mer, et paniers gourmands à gagner ! Une belle manière de valoriser le commerce de proximité et de se régaler en famille.",
  start_date: Date.new(2025, 8, 9),
  end_date: Date.new(2025, 8, 10)
)
