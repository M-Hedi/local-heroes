require "open-uri"
# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end


if Rails.env.development?
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

end

puts "DB cleaned"
# end

puts "Creating users"


# query = <<~OVERPASS
# [out:json][timeout:25];
# area["name"="Lille"]["admin_level"="8"]->.searchArea;
# (
# node["shop"="bakery"](area.searchArea);
# way["shop"="bakery"](area.searchArea);
# node["shop"="butcher"](area.searchArea);
# way["shop"="butcher"](area.searchArea);
# node["shop"="hardware"](area.searchArea);
# way["shop"="hardware"](area.searchArea);
# node["shop"="greengrocer"](area.searchArea);
# way["shop"="greengrocer"](area.searchArea);
# node["shop"="convenience"](area.searchArea);
# way["shop"="convenience"](area.searchArea);
# );
# out body;
# OVERPASS

# response = Faraday.post('https://overpass-api.de/api/interpreter') do |req|
#   req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
#   req.body = URI.encode_www_form(data: query)
# end

# data = JSON.parse(response.body)
# stores = data["elements"]

user1 = User.create!(
  first_name: "Louis",
  last_name: "Louis",
  email: "louis.durot@auptitlouis.fr",
  password: "password",
  address: "12 rue des Boulangers, 59000 Lille, France",
  phone_number: "06 52 18 43 97"
)
user2 = User.create!(
  first_name: "Marie",
  last_name: "Dupont",
  email: "marie.dupont@example.com",
  password: "password",
  address: "18 rue de Wazemmes, 59000 Lille, France",
  phone_number: "06 74 22 11 33"
)
user3 = User.create!(
  first_name: "Sophie",
  last_name: "Martin",
  email: "sophie.martin@example.com",
  password: "password",
  address: "22 rue de Flandre, 59000 Lille, France",
  phone_number: "06 78 99 88 77"
)
user4 = User.create!(
  first_name: "Ahmed",
  last_name: "Ben Ali",
  email: "ahmed.benali@example.com",
  password: "password",
  address: "18 rue de Wazemmes, 59000 Lille, France",
  phone_number: "06 70 22 33 44"
)
user5 = User.create!(
  first_name: "Claire",
  last_name: "Legrand",
  email: "claire.legrand@example.com",
  password: "password",
  address: "14 rue des Arts, 59000 Lille, France",
  phone_number: "06 55 44 33 22"
)

jean_naim = User.create!(
  first_name: "Jean",
  last_name: "Naim",
  email: "j.naim@gmail.com",
  password: "password",
  address:"23 Rue Jules Guesde, 59000 Lille",
  phone_number: "01.12.55.64.65"
)

henry_lacroix= User.create!(
  first_name: "Henry",
  last_name: "Lacroix",
  email: "h.lacroix@gmail.com",
  password: "password",
  address: "158 Rue Léon Gambetta, 59000 Lille",
  phone_number: "01.82.55.64.65"
)

david_engels = User.create!(
  first_name: "David",
  last_name: "Engels",
  email: "d.engels@gmail.com",
  password: "password",
  address: "271 Rue Léon Gambetta, 59000 Lille",
  phone_number: "01.12.55.64.65"
)

lazhar_fardia = User.create!(
  first_name: "Lazhar",
  last_name: "Ben Fardia",
  email: "l.fardia@gmail.com",
  password: "password",
  address: "204 Rue Léon Gambetta, 59000 Lille",
  phone_number: "01.12.55.64.65"
)

sophie_elso = User.create!(
  first_name: "Sophie",
  last_name: "Elso",
  email: "s.elso@gmail.com",
  password: "password",
  address: "234 Rue Léon Gambetta, 59000 Lille",
  phone_number: "01.12.55.64.65"
)

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
gregory_delassus = User.create!(
  first_name: "Grégory",
  last_name: "Delassus",
  email: "g.delassus@email.fr",
  password: "password",
  address: "rue ratisbonne, 59000 Lille",
  phone_number: "0601020304"
)
julien_lefevre = User.create!(
  first_name: "Julien",
  last_name: "Lefèvre",
  email: "j.lefevre@email.fr",
  password: "password",
  address: "rue paul lafargue, 59000 Lille",
  phone_number: "0605060708"
)
françois_ervrard = User.create!(
  first_name: "François",
  last_name: "Evrard",
  email: "f.ervrard@email.fr",
  password: "password",
  address: "rue d'antin, 59000 Lille",
  phone_number: "0609101213"
)
kamel_bouchra = User.create!(
  first_name: "Kamel",
  last_name: "Bouchra",
  email: "k.bouchra@email.fr",
  password: "password",
  address: "rue léon gambetta, 59000 Lille",
  phone_number: "0614151617"
)
nacer_goumi = User.create!(
  first_name: "Nacer",
  last_name: "Goumi",
  email: "n.goumi@email.fr",
  password: "password",
  address: "rue du chaufour, 59000 Lille",
  phone_number: "0618192021"
)

albane_dupont = User.create!(
  first_name: "Albane",
  last_name: "Dupont",
  email: " albane.dupont@mail.com " ,
  password: "password",
  address: " 27 rue d'Iéna,  59000 Lille ",
  phone_number: "06 71 90 29 56"
)

fatima_aboudarham = User.create!(
  first_name: "Fatima",
  last_name: "Aboudarham",
  email: " fatima.aboudarham@mail.com " ,
  password: "password",
  address: " 38 rue Louis Faure,  59000 Lille ",
  phone_number: "06 56 87 31 76"
)

john_smith = User.create!(
  first_name: "John",
  last_name: "Smith",
  email: " john.smith@mail.com " ,
  password: "password",
  address: " 71 rue des postes,  59000 Lille ",
  phone_number: "06 12 68 43 09"
)

linhdan_nguyen = User.create!(
  first_name: " Linh Dan",
  last_name: " Nguyen",
  email: " linhdan.nguyen@mail.com " ,
  password: "password",
  address: " 46 rue Barthélémy Delespaul,  59000 Lille ",
  phone_number: " 07 60 74 25 38"
)

carlos_desousa = User.create!(
  first_name: "Carlos",
  last_name: " De Sousa",
  email: "carlos.desousa@mail.com",
  password: "password",
  address: " 100 rue de Wazemmes,  59000 Lille ",
  phone_number: "07 58 28 55 87"
)

puts "Created #{User.count} users"
puts "Creating stores"


store_1 = Store.create!(
  user: user_claire,
  description: "Poissonnerie iconique à Wazemmes, sel et savoir-faire familial, poissons et fruits de mer ultra‑frais, pêche durable et traiteur local. réunion.",
  name: "Le Petit Mousse",
  category: "Poissonnerie",
  phone_number: "0320545506",
  address:"396 Rue Léon Gambetta, Lille" #A jouter un addresse au modéle store
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749543995/store_1_wa59hr.jpg").open
store_1.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
store_1.save

store_2 = Store.create!(
  user: user_thomas,
  description: "Poissonnerie du marché de Wazemmes, offre poissons frais et fruits de mer variés, ambiance conviviale, service expert et tarif correct.",
  name: "Poissonnerie La Marée",
  category: "Poissonnerie",
  phone_number: "0320679832",
  address: "78 Rue Jules Guesde, Lille" #A jouter un addresse au modéle store
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749543995/store_2_lhexxj.jpg").open
store_2.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
store_2.save

store_3 = Store.create!(
  user: user_rachid,
  description: "Poissonnerie “La Bonne Pêche” aux Halles de Wazemmes : poissons & fruits de mer de Boulogne, fraîcheur quotidienne, service convivial.",
  name: "La bonne pêche",
  category: "Poissonnerie",
  phone_number: "0602319656",
  address: "25 Pl. Nouvelle Aventure, Lille" #A jouter un addresse au modéle store
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749543996/store_3_iwzkij.jpg").open
store_3.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
store_3.save


store_4 = Store.create!(
  user: user_sophie,
  description: "Poissonnerie de Wazemmes, poissons frais du jour, crustacés variés et accueil chaleureux. Qualité et conseils personnalisés garantis.",
  name: "Au Petit Poissonnier",
  category: "Poissonnerie",
  phone_number: "0320429750",
  address: "25 Pl. Nouvelle Aventure, Lille" #A jouter un addresse au modéle store
)

file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749543996/store_4_prirm4.jpg").open
store_4.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
store_4.save

store_5 = Store.create!(
  user: user_edouard,
  description: "Au Petit Poissonnier",
  name: "The Shark Poissonnerie",
  category: "Poissonnerie",
  phone_number: "0644176887",
  address: "325 Av. de Dunkerque, Lille" #A jouter un addresse au modéle store
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749543997/store_5_ltcae2.jpg").open
store_5.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
store_5.save

ferme_du_beau = Store.create!(
user: gregory_delassus,
description: " J’ai un beau métier qui consiste à élever des animaux et à nourrir
des familles. Avec l’aide de mon équipe, conscients de nos responsabilités,
nous prenons beaucoup de plaisir à faire les choses bien, dans le respect de l’animal,
de nos consommateurs et de l’environnement. Nous sommes récompensés par l’excellence
de nos produits, la satisfaction et le soutien de nos clients qui réfléchissent à
ce qu’ils mangent.",
name: "Ferme du Beau Pays",
category: "Boucherie",
address: "Pl. Nouvelle Aventure, Lille",
phone_number: "0320559025"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749543990/boucherie3_ftpxfb.jpg").open
ferme_du_beau.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
ferme_du_beau.save

boucherie_ennasr = Store.create!(
user: nacer_goumi,
description: "Chaque pièce est soigneusement sélectionnée,
découpée dans la pure tradition bouchère, pour garantir fraîcheur,
qualité et goût incomparable. Que ce soit pour un rôti fondant,
une côte de bœuf savoureuse ou des charcuteries maison,",
name: "Boucherie ENNASR",
category: "Boucherie",
address: "34 Pl. Nouvelle Aventure, Lille",
phone_number: "0320402079"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749543990/boucherie4_admlzs.jpg").open
boucherie_ennasr.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
boucherie_ennasr.save

boucherie_ervrard = Store.create!(
user: françois_ervrard,
description: "Issu d'une famille de bouchers depuis deux générations,
François Evrard est un passionné du beau et bon produit.
Diplômé de l'école de cuisine Ferrandi à Paris et après un passage dans divers
établissements réputés de la capitale, c'est en 1988 qu'il décide de revenir dans le Nord.",
name: "Maison Evrard",
category: "Boucherie",
address: "374 Rue Léon Gambetta, Lille",
phone_number: "0328380700"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749543990/boucherie2_b9ajwg.jpg").open
boucherie_ervrard.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
boucherie_ervrard.save

boucherie_kamel = Store.create!(
user: kamel_bouchra,
description: "Située au cœur d’une région riche en traditions agricoles, cette boucherie artisanale
met à l’honneur des viandes issues d’élevages locaux, respectueux du bien-être animal
et des cycles naturels.",
name: "Boucherie Kamel",
category: "Boucherie",
address: "35 Rue du Marché, Lille",
phone_number: "0320143955"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749543990/boucherie5_inn2iq.jpg").open
boucherie_kamel.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
boucherie_kamel.save

ferme_du_nord = Store.create!(
user: julien_lefevre,
description: "La Ferme du Nord est bien plus qu’une simple boucherie :
c’est une invitation à redécouvrir les saveurs authentiques du terroir.
C'est l’adresse incontournable pour les amateurs de bonne chère
et de produits vrais.",
name: "LA Ferme Du Nord",
category: "Boucherie",
address: "5 bis Rue Jules Guesde, Lille",
phone_number: "0374684276"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749543990/boucherie3_ftpxfb.jpg").open
ferme_du_nord.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
ferme_du_nord.save

game_cash = Store.create!(
  user: david_engels,
  description: "Gamecash Lille propose jeux, consoles, accessoires, objets geek d’occasion, retrogaming, cartes et goodies, avec accueil sympa et prix attractifs. ",
  name: "GameCash",
  category: "Jeux",
  phone_number: "03.62.28.53.07",
  address: "271 Rue Léon Gambetta, Lille"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749547600/development/p815wvkcljh4g0010jpehgeyccax.jpg").open
game_cash.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
game_cash.save

bon_chic = Store.create!(
  user: sophie_elso,
  description: "Bon Chic Bonne Fripe propose une sélection soignée de fripes (sportswear, vintage, luxe) pour hommes et femmes, ambiance conviviale et renouvellement régulier",
  name: "Bon Chic",
  category: "Friperie",
  phone_number: "03.88.28.53.15",
  address: "234 Rue Léon Gambetta, 59000 Lille"
)


fromagerie_coeur = Store.create!(
  user: albane_dupont,
  description: "La Fromagerie « Au coeur de Lille » vous accueille
		Du Mardi au Samedi: 8h à 20h
		Dimanche: 8h à 15h
		Halles de Wazemmes",
  name: "Au coeur de Lille",
  category: "Fromagerie",
  phone_number: "03 20 40 01 21",
  address: "Pl. Nouvelle Aventure, Lille "
)


fromagerie_philippe = Store.create!(
  user: carlos_desousa,
  description: "Au cœur du quartier de Wazemmes, à deux pas des Halles
		Du Mardi au Samedi: 9h-13h30 à 14h30-19h
		Dimanche: 9h à 12h45",
  name: "Fromagerie P.Olivier",
  category: "Fromagerie",
  phone_number: "03 21 31 94 74 ",
  address: "345, Rue Léon Gambetta, Lille"
)


souk_alep = Store.create!(
  user: fatima_aboudarham,
  description: "Le Souk d'Alep - épicerie orientale,
		Du Lundi au Dimanche: 9h30-21h",
  name: "Souk d'Alep",
  category: "Épicerie",
  phone_number: "06 68 00 60 10",
  address: "61 rue d'Arcole, Lille"
)


epicerie_equitable = Store.create!(
  user: john_smith,
  description: "L'épicerie équitable Lille Wazemmes,
		dans la Halles de Wazemmes
		mardi : 8h30-14h30 et 16h30 à 20h00
		mercredi : 8h30 à 20h00
		jeudi : 8h30-14h30 et 16h30 à 20h00
		vendredi et samedi : 8h30 à 20h00
		dimanche : 8h30 à 15h00",
  name: "L'épicerie équitable",
  category: "Épicerie",
  phone_number: "03 20 51 21 46",
  address: "Pl. Nouvelle Aventure, Lille"
)


afrobeauty = Store.create!(
  user: linhdan_nguyen,
  description: "Beauté, cosmétique et soins
		Magasin capillaires et cosmétiques
		📍Lille: 281 Rue Léon Gambetta - 59000
		📍Roubaix: 8-10 grande Rue - 59100
		📍Amiens : 13 rue de Noyon - 80000",
  name: "Afrobeauty",
  category: "Beauté",
  phone_number: " 03 20 19 64 51",
  address: "281 rue Leon gambetta, Lille"
)

store1 = Store.create!(
  user: user1,
  description: "Au p’tit Louis est né en 2013 grâce à la complicité de deux anciens collègues partageant les mêmes valeurs : respect du produit, proximité avec le client et éco-responsabilité.",
  name: "Au P'tit Louis",
  category: "Boulangerie",
  phone_number: "0320921962",
  address: "5 Pl. de la Solidarité, Lille"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749547607/development/uywbpuftc412za5o73l3m3eohgll.jpg").open
store1.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
store1.save


store2 = Store.create!(
  user: user2,
  description: "La Maison Dupont, boulangerie artisanale fondée en 2010, privilégie le goût authentique et les produits locaux pour une qualité optimale.",
  name: "Maison Dupont",
  category: "Boulangerie",
  phone_number: "0320223344",
  address: "18 rue de Wazemmes, Lille"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749547612/development/o41x72fu77t6kvj67s8mbqiiddps.png").open
store2.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
store2.save

store3 = Store.create!(
  user: user3,
  description: "La Boulangerie Sophie allie tradition et modernité pour offrir à ses clients des produits frais et savoureux chaque jour.",
  name: "Chez Sophie",
  category: "Boulangerie",
  phone_number: "0320456789",
  address: "22 rue de Flandre, Lille"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749547610/development/m6v2j1c3aro6qg0d2s19vnjg8ohk.png").open
store3.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
store3.save


store4 = Store.create!(
  user: user4,
  description: "La Boulangerie Aziza, reconnue à Wazemmes pour ses produits frais et son savoir-faire traditionnel.",
  name: "L'Aziza",
  category: "Boulangerie",
  phone_number: "0320223344",
  address: "18 rue de Wazemmes, Lille"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749547611/development/d3imu06hdjb5cqae8b2tre55lwth.jpg").open
store4.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
store4.save

store5 = Store.create!(
  user: user5,
  description: "La Boulangerie Legrand, depuis 2005, propose une large gamme de pains et pâtisseries faits maison, en alliant tradition et innovation.",
  name: "B.Legrand",
  category: "Boulangerie",
  phone_number: "0320554433",
  address: "14 rue des Arts, Lille"
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749547612/development/o41x72fu77t6kvj67s8mbqiiddps.png").open
store5.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
store5.save


eco_chic = Store.create!(
  user: lazhar_fardia,
  description: "Eco‑Chic est une friperie mixte sur Gambetta proposant des pièces vintage, sportwear et chic renouvelées chaque semaine dans une ambiance conviviale",
  name: "Eco-chic",
  category: "Friperie",
  phone_number: "03.88.28.53.15",
  address: "204 Rue Léon Gambetta, 59000 Lille"
)

forum_batiment = Store.create!(
  user: jean_naim,
  description: "Notre expertise s'étend de la plomberie sanitaire au chauffage, en passant par la serrurerie.",
  name: "Forum Bâtiment",
  category: "Quincaillerie",
  phone_number: "03.61.26.41.41",
  address:"238 rue Roger Salengro, 59260 Lille"
)

chez_henry = Store.create!(
  user: henry_lacroix,
  description: "Chez Henry est une boutique solidaire Croix‑Rouge à Lille, ouverte du jeudi au samedi, proposant vêtements, accessoires de seconde main à petits prix, avec une ambiance conviviale et engagée.",
  name: "Chez Henry",
  category: "Friperie",
  phone_number: "03.88.78.93.55",
  address: "158 Rue Léon Gambetta, 59000 Lille"
)

puts "Created #{Store.count} stores"

# Cloudinary à installer pour les images seed

pain_siegle_store_five = Product.create!(
      name: "Pain de Seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store5
    )
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749631603/pain_de_seigle_lkchmd.jpg").open
pain_siegle_store_five.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
pain_siegle_store_five.save


pain_au_lait_store_five = Product.create!(
      name: "Pain au Lait",
      price: 1.20,
      category: "Viennoiserie",
      discount: 0.05,
      stock: 40,
      loyalty_price: 50,
      status: ['available', 'unavailable'].sample,
      description: "Petit pain moelleux au lait, parfait pour le goûter ou le petit-déjeuner des enfants.",
      store: store5
      )
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749550312/development/vehgr6z475n893o3i13ioohon7si.webp").open
pain_au_lait_store_five.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
pain_au_lait_store_five.save

tartelette_citron_store_five = Product.create!(
 name: "Tarte Citron",
      price: 3.70,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 20,
      loyalty_price: 90,
      status: ['available', 'unavailable'].sample,
      description: "Pâte sablée croustillante garnie d'une crème au citron acidulée et d'une meringue légère.",
      store: store5)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749631606/tartelette_citron_meringue_x4lpxn.jpg").open
tartelette_citron_store_five.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
tartelette_citron_store_five.save


pain_aux_olives_store_five = Product.create!(
      name: "Pain aux Olives",
      price: 2.80,
      category: "Pain",
      discount: 0.12,
      stock: 25,
      loyalty_price: 70,
      status: ['available', 'unavailable'].sample,
      description: "Pain moelleux agrémenté d'olives noires, parfait pour accompagner vos apéritifs et repas.",
      store: store5)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749631603/pain_aux_olives_ughxfl.jpg").open
pain_aux_olives_store_five.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
pain_aux_olives_store_five.save



pain_siegle_store_four = Product.create!(
      name: "Pain de Seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store4
)
file = URI.parse("https://res.cloudinary.com/dmt3jxemt/image/upload/v1749631603/pain_de_seigle_lkchmd.jpg").open
pain_siegle_store_four.photo.attach(io: file, filename: "pain_siegle.png", content_type: "image/jpg")
pain_siegle_store_four.save

pain_au_lait_store_four = Product.create!(
   name: "Pain au Lait",
      price: 1.20,
      category: "Viennoiserie",
      discount: 0.05,
      stock: 40,
      loyalty_price: 50,
      status: ['available', 'unavailable'].sample,
      description: "Petit pain moelleux au lait, parfait pour le goûter ou le petit-déjeuner des enfants.",
      store: store4
      )

tartelette_citron_store_four = Product.create!(
    name: "Tarte Citron",
      price: 3.70,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 20,
      loyalty_price: 90,
      status: ['available', 'unavailable'].sample,
      description: "Pâte sablée croustillante garnie d'une crème au citron acidulée et d'une meringue légère.",
      store: store4
)

pain_aux_olives_store_four = Product.create!(
 name: "Pain aux Olives",
      price: 2.80,
      category: "Pain",
      discount: 0.12,
      stock: 25,
      loyalty_price: 70,
      status: ['available', 'unavailable'].sample,
      description: "Pain moelleux agrémenté d'olives noires, parfait pour accompagner vos apéritifs et repas.",
      store: store4
)


pain_siegle_store_three = Product.create!(
  name: "Pain de Seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store3
      )
pain_au_lait_store_three = Product.create!(
   name: "Pain au Lait",
      price: 1.20,
      category: "Viennoiserie",
      discount: 0.05,
      stock: 40,
      loyalty_price: 50,
      status: ['available', 'unavailable'].sample,
      description: "Petit pain moelleux au lait, parfait pour le goûter ou le petit-déjeuner des enfants.",
      store: store3)

tartelette_citron_store_three = Product.create!(
   name: "Tarte Citron",
      price: 3.70,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 20,
      loyalty_price: 90,
      status: ['available', 'unavailable'].sample,
      description: "Pâte sablée croustillante garnie d'une crème au citron acidulée et d'une meringue légère.",
      store: store3
)

pain_aux_olives_store_three = Product.create!(
      name: "Pain aux Olives",
      price: 2.80,
      category: "Pain",
      discount: 0.12,
      stock: 25,
      loyalty_price: 70,
      status: ['available', 'unavailable'].sample,
      description: "Pain moelleux agrémenté d'olives noires, parfait pour accompagner vos apéritifs et repas.",
      store: store3)

pain_siegle_store_two = Product.create!(
name: "Pain de Seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store2)

pain_au_lait_store_two = Product.create!(
name: "Pain au Lait",
      price: 1.20,
      category: "Viennoiserie",
      discount: 0.05,
      stock: 40,
      loyalty_price: 50,
      status: ['available', 'unavailable'].sample,
      description: "Petit pain moelleux au lait, parfait pour le goûter ou le petit-déjeuner des enfants.",
      store: store2
)

tartelette_citron_store_two = Product.create!(
  name: "Tarte Citron",
      price: 3.70,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 20,
      loyalty_price: 90,
      status: ['available', 'unavailable'].sample,
      description: "Pâte sablée croustillante garnie d'une crème au citron acidulée et d'une meringue légère.",
      store: store2
)

pain_aux_olives_store_two = Product.create!(
  name: "Pain aux Olives",
      price: 2.80,
      category: "Pain",
      discount: 0.12,
      stock: 25,
      loyalty_price: 70,
      status: ['available', 'unavailable'].sample,
      description: "Pain moelleux agrémenté d'olives noires, parfait pour accompagner vos apéritifs et repas.",
      store: store2
)


pain_siegle_store_one = Product.create!(
      name: "Pain de Seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store1
)

pain_au_lait_store_one = Product.create!(

      name: "Pain de Seigle",
      price: 2.50,
      category: "Pain",
      discount: 0.10,
      stock: 30,
      loyalty_price: 65,
      status: ['available', 'unavailable'].sample,
      description: "Pain rustique à base de farine de seigle, au goût légèrement acidulé, idéal avec du fromage.",
      store: store1
)

tartelette_citron_meringue_store_one = Product.create!(
      name: "Tarte Citron",
      price: 3.70,
      category: "Pâtisserie",
      discount: 0.15,
      stock: 20,
      loyalty_price: 90,
      status: ['available', 'unavailable'].sample,
      description: "Pâte sablée croustillante garnie d'une crème au citron acidulée et d'une meringue légère.",
      store: store1
)

pain_aux_olives_store_one = Product.create!(
  name: "Pain aux Olives",
      price: 2.80,
      category: "Pain",
      discount: 0.12,
      stock: 25,
      loyalty_price: 70,
      status: ['available', 'unavailable'].sample,
      description: "Pain moelleux agrémenté d'olives noires, parfait pour accompagner vos apéritifs et repas.",
      store: store1)


poulet_rotie = Product.create!(
  name: "Poulet Rôti",
  price: 7.50,
  category: "Boucherie",
  discount: 5.90,
  stock: rand(1..10),
  loyalty_price: 5,
  status: ['available', 'unavailable'].sample,
  description: "Poulet rôti avec ses pommes de terre et épices.
  A commander 4 heures à l'avance minimum",
  store: ferme_du_nord
)
cordon_bleu = Product.create!(
  name: "Cordon Bleu",
  price: 3.20,
  category: "Boucherie",
  discount: 2.75,
  stock: rand(1..20),
  loyalty_price: 2,
  status: ['available', 'unavailable'].sample,
  description: "Cordon bleu volaille avec son fromage cheddar et sa panure maison.
  A commander 4 heures à l'avance minimum.",
  store: boucherie_kamel
)

cote_de_boeuf = Product.create!(
  name: "Cote de Boeuf",
  price: 19.90,
  category: "Boucherie",
  discount: 15.90,
  stock: rand(1..15),
  loyalty_price: 15,
  status: ['available', 'unavailable'].sample,
  description: "Cote de boeuf origine France, poids au kilo.",
  store: boucherie_ervrard
)

paupiette_de_veau = Product.create!(
  name: "Paupiette de Veau",
  price: 12.90,
  category: "Boucherie",
  discount: 10.90,
  stock: rand(1..15),
  loyalty_price: 10,
  status: ['available', 'unavailable'].sample,
  description: "Paupiette de veau origine France, poids au kilo.",
  store: ferme_du_beau
)

filet_de_dinde = Product.create!(
  name: "Filet de Dinde",
  price: 2.72,
  category: "Boucherie",
  discount: 1.75,
  stock: rand(1..25),
  loyalty_price: 1,
  status: ['available', 'unavailable'].sample,
  description: "Filet de blanc de dinde, au poids env 250g.",
  store: boucherie_ennasr
)


Product.create!(
  name: "Veste denim",
  price: 20,
  category: "Vêtements",
  stock: 4,
  status: 'available',
  description: "Veste en denim oversize issue de dons, style vintage, idéale pour un look casual solidaire et éthique.",
  store: chez_henry
)

Product.create!(
  name: "Col Roulé",
  price: 12,
  category: "Vêtements",
  stock: 6,
  status: 'available',
  description: "Pull col roulé en laine douce, taille mixte, parfait pour l’hiver, durable et responsable.",
  store: chez_henry
)

Product.create!(
  name: "Jean Slim",
  price: 15,
  discount: 10,
  category: "Vêtements",
  stock: 5,
  status: 'available',
  description: "Jean slim homme, denim brut, coupe actuelle, reconditionné, parfait pour une garde-robe responsable à petit prix.",
  store: chez_henry
)

Product.create!(
  name: "Robe Fleurie",
  price: 18,
  category: "Vêtements",
  stock: 3,
  status: 'available',
  description: "Robe mi-longue imprimée florale, tissu retro, idéale pour une tenue estivale responsable et solidaire.",
  store: chez_henry
)

Product.create!(
  name: "Sac à Main",
  price: 69,
  discount: 50,
  category: "Accessoires",
  stock: 1,
  status: 'available',
  description: "Sac à main en cuir d’occasion, anses solides et belle patine, parfait pour compléter un look responsable et stylé.",
  store: chez_henry
)

Product.create!(
  name: "Veste en Jean",
  price: 49,
  category: "Vêtements",
  stock: 5,
  status: 'available',
  description: "Veste Levi’s authentique, coupe oversize, denim lavé, idéale pour un style rétro casual avec tenue durable et chic.",
  store: eco_chic
)

Product.create!(
  name: "Col Roulé",
  price: 29,
  category: "Vêtements",
  stock: 8,
  status: 'available',
  description: "Pull col roulé en maille douce, coupe unisexe, parfait pour les jours frais, alliant confort, élégance et mode responsable.",
  store: eco_chic
)

Product.create!(
  name: "Pantalon Chino",
  price: 39,
  discount: 20,
  category: "Vêtements",
  stock: 4,
  status: 'available',
  description: "Chino Tommy Hilfiger en coton, coupe droite, style preppy, parfait pour une tenue soignée et durable au quotidien.",
  store: eco_chic
)

Product.create!(
  name: "Chemisier Soie",
  price: 34,
  category: "Vêtements",
  stock: 6,
  status: 'available',
  description: "Chemisier en soie recyclée à motif floral, coupe fluide, idéal pour un look chic, léger, responsable et très féminin.",
  store: eco_chic
)

Product.create!(
  name: "Manteau Long",
  price: 69,
  discount: 50,
  category: "Vêtements",
  stock: 3,
  status: 'available',
  description: "Manteau d’occasion en laine mélangée, coupe longue classique, doublure soignée, parfait pour affronter l’hiver avec style et éthique.",
  store: eco_chic
)


Product.create!(
  name: "Veste Adidas",
  price: 45,
  discount: 30,
  category: "Vêtements",
  stock: 4,
  status: 'available',
  description: "Veste sportswear Adidas vintage, polyester, coupe old‑school, idéale pour un look rétro cool au quotidien.",
  store: bon_chic
)

Product.create!(
  name: "Sweat Fila",
  price: 35,
  category: "Vêtements",
  stock: 1,
  status: 'available',
  description: "Sweat Fila en coton doux, logo brodé, style années 90, parfait pour un confort stylé et décontracté.",
  store: bon_chic
)

Product.create!(
  name: "Chemise Hawaïenne",
  price: 28,
  category: "Vêtements",
  stock: 3,
  status: 'available',
  description: "Chemise vintage à motif tropical, coupe ample, tissu respirant, idéale pour un look estival chic et coloré.",
  store: bon_chic
)

Product.create!(
  name: " Jean Levi’s",
  price: 55,
  discount: 45,
  category: "Vêtements",
  stock: 2,
  status: 'available',
  description: "Jean Levi’s 501 classique, coupe droite, denim brut épais, pièce iconique vintage prête à durer des années.",
  store: bon_chic
)

Product.create!(
  name: "Casquette",
  price: 18,
  category: "Accessoires",
  stock: 8,
  status: 'available',
  description: "Casquette Champion vintage, broderie logo, tissu coton, réglable, accessoire parfait pour styliser une tenue casual.",
  store: bon_chic
)


Product.create!(
  name: "Manette PS4",
  price: 29.99,
  category: "Gaming",
  stock: 12,
  status: 'available',
  description: "Manette PS4 reconditionnée, testée, joystick précis, finition mate, parfaite pour sessions longues et confortables.",
  store: game_cash
)

Product.create!(
  name: "Super Mario Odyssey",
  price: 49.99,
  category: "Gaming",
  discount: 35,
  stock: 7,
  status: 'available',
  description: "Aventure 3D emblématique sur Switch, cartouche en bon état, jaquette incluse, prêt à explorer le Royaume Champignon.",
  store: game_cash
)

Product.create!(
  name: "Casque Audio",
  price: 24.99,
  category: "Multimédia",
  stock: 5,
  status: 'available',
  description: "Casque sans fil, son stéréo, coussinets confort, connexion stable Bluetooth, idéal pour musique et gaming mobile.",
  store: game_cash
)

Product.create!(
  name: "Carte Pokémon",
  price: 4.99,
  category: "Jeux",
  stock: 50,
  status: 'available',
  description: "Booster neuf Pokémon TCG, contenu scellé, parfait pour collectionner ou compléter votre deck avec surprises à l’ouverture.",
  store: game_cash
)

Product.create!(
  name: "3DS XL",
  price: 109.99,
  discount: 90,
  category: "Gaming",
  stock: 3,
  status: 'available',
  description: "Console 3DS XL reconditionnée, écran large, charnières solides, idéale pour découvrir ou redécouvrir les classiques Nintendo.",
  store: game_cash
)

Product.create!(
  name: "Cruciforme",
  price: 8.60,
  category: "Outils",
  discount: 5,
  stock: 50,
  status: "available",
  description: "Tournevis cruciforme robuste avec manche ergonomique antidérapant, idéal pour vissage précis et confortable au quotidien.",
  store: forum_batiment
)

Product.create!(
  name: "Vis à bois",
  price: 3.50,
  category: "Outils",
  stock: 60,
  status: "available",
  description: "Vis en acier 4x40mm (boîte de 100) zingué pour bois tendres et durs, parfaites pour assemblages solides et durables.",
  store: forum_batiment
)

Product.create!(
  name: "Charnières",
  price: 1.80,
  category: "Outils",
  stock: 33,
  status: 'available',
  description: "Charnières robustes en laiton 40mm (lot de 2), parfaites pour portes de meubles, coffrets ou petites boîtes en bois.",
  store: forum_batiment
)

Product.create!(
  name: "Ruban Adhésif",
  price: 2.20,
  category: "Électricité",
  discount: 2,
  stock: 37,
  loyalty_price: 1,
  status: 'unavailable',
  description: "Ruban isolant 10m noir résistant à la chaleur, idéal pour petits travaux et réparations électriques domestiques.",
  store: forum_batiment
)

Product.create!(
  name: "Marteau",
  price: 11.40,
  category: "Outils",
  stock: 18,
  status: 'available',
  description: "Marteau équilibré avec manche en fibre et tête acier trempé, idéal pour les travaux de clouage précis.",
  store: forum_batiment
)

Product.create!(
  name: "Saumon",
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
  name: "Crevettes",
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
  name: "Sole Meunière",
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
  name: "Huîtres",
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
  name: "Thon",
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
  name: "Moules",
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
  name: "Langoustines",
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
  name: "Cabillaud",
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
  name: "Saint-Jacques",
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
  name: "Sardines",
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
  name: "Homard",
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
  name: "Dorade",
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
  name: "Bulots",
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
  name: "Turbot",
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
  name: "Plateau Fruits de Mer",
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
  name: "Merlan",
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
  name: "Tourteau",
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
  name: "Rouget",
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
  name: "Encornets",
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
  name: "Maquereau",
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
  name: "Palourdes",
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
  name: "Lotte",
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
  name: "Étrilles",
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
  name: "Bar",
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
  name: "Soupe de Poissons",
  price: 7.90,
  category: "Préparation",
  discount: 7.11,
  stock: 15,
  loyalty_price: 7,
  status: "available",
  description: "Soupe de poisson artisanale préparée avec poissons de roche. Goût authentique méditerranéen, servir avec rouille et croûtons.",
  store: store_5
)

Product.create!(
  name: "Maroilles",
  price: 5.75,
  category: "Fromagerie",
  discount: 4.50, # A changer sur le modéle Product vers float
  stock: 10,
  loyalty_price: 4,
  status: ['available', 'unavailable'].sample,
  description:  "Maroilles AOP,  lait français, maroilles produits en région nord, 10 mois ", #charvar entre 120 et 150 caractéres
  store: fromagerie_philippe
)

Product.create!(
  name:  "Curry Indien",
  price: 4.50,
  category: "Epicerie",
  discount: 3.99,
  stock: 30,
  loyalty_price: 3,
  status: ['available', 'unavailable'].sample,
  description: " Curry indien,  pot de 1kg, importer directement du marché de Bombay, Curry épicé ",
  store: souk_alep
)

Product.create!(
  name: " Beurre Karité ",
  price: 3.56,
  category: "Beauté",
  discount: 3,
  stock: 20,
  loyalty_price: 2,
  status: ['available', 'unavailable'].sample,
  description: "Pot de beurre de karité,  poids : 1,5kg, Utilisable sur vos cheveux et votre peau, hydratation garantie.",
  store: afrobeauty
)

Product.create!(
  name: "Graines de Tournesol",
  price: 4.10,
  category: "Epicerie",
  discount: 2.99,
  stock: 5,
  loyalty_price: 2,
  status: ['available', 'unavailable'].sample,
  description: " Sachet de graines de tournesol décortiquées, poids : 1kg, provenance : Européene et non-européenne ",
  store: epicerie_equitable
)

Product.create!(
  name: "Tomme de Savoir",
  price: 5,
  category: "Fromagerie",
  discount: 3.15,
  stock: 15,
  loyalty_price: 3,
  status: ['available', 'unavailable'].sample,
  description: "Belle tomme de savoir,  600gr ",
  store: fromagerie_coeur
)

puts "Created #{Product.count} products"

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

Event.create!(
  store: bon_chic,
  title: "Fripes en Fête",
  start_date: Date.new(2025, 6, 16),
  end_date: Date.new(2025, 7, 1),
  description: "Trois friperies de la rue Gambetta – Bon Chic Bonne Fripe, Eco-Chic et Chez Henry –
  s’unissent pour un week-end festif placé sous le signe de la mode responsable.
  Au programme : bons plans, ambiance musicale, promos jusqu’à -30 % sur une sélection d’articles,
  portants extérieurs, et pièces uniques à prix mini. L’occasion rêvée de (re)découvrir les pépites
  vintage de Lille et soutenir la seconde main locale."
)

Event.create!(
  store: game_cash,
  title: "Quartier en Vrac – Le Marché des Trésors Cachés",
  start_date: Date.new(2025, 7, 3),
  end_date: Date.new(2025, 7, 20),
  description: "Le quartier Gambetta s’anime pour un week-end de chine et de découvertes !
  Friperies, quincailleries et boutiques geek s’unissent pour faire rayonner le charme unique du
  “vrac lillois” : promos sur les articles d’occasion, stand jeux rétro, bricolage créatif,
  sélection d’objets insolites et looks vintage à petits prix.
  Un marché urbain festif et coloré à ciel ouvert, entre trouvailles, musique et bonne humeur."
)
Event.create!(
  store: boucherie_ervrard,
  title: "Nocturne Gourmande Wazemmes",
  description: "La Nocturne gourmande de Waz’en bouche revient jeudi 12 juin,
  à partir de 18h, parvis des Halles et rue Gambetta. Les artisans
  et commerces de bouche de Wazemmes vont vous régaler !",
  start_date: Date.new(2025, 6, 12),
  end_date: Date.new(2025, 6, 12)
)
Event.create!(
  store: ferme_du_beau,
  title: "Lille Street Food festival",
  description: "2 au 5 octobre 2025
  Euratechnologies
Place de Saintignon, 165 Avenue de Bretagne, Lille
Métros Canteleu Euratechnologies ou Bois Blancs (Ligne 2)",
  start_date: Date.new(2025, 10, 2),
  end_date: Date.new(2025, 10, 5)
)
Event.create!(
  store: fromagerie_coeur,
  title: "Fais ta mozza",
  description: " Tu es le.la bienvenue ce samedi pour apprendre à faire ta propre mozza
  dans notre magasin avec le fromager Didier Laiteau.
  Tu as juste à venir au créneau de ton choix, prévois 10 euros de participation. Fais ta mozza
  et repars avec au bout de 2h. ",
  start_date: Date.new(2025, 6, 12),
  end_date: Date.new(2025, 6, 13)
)

Event.create!(
  store: souk_alep,
  title: "Atelier boulettes épicées",
  description: " Viens découvrir comment faire des boulettes de boeuf avec tous
  nos nouveaux épices, prévois une participation de 15 euros,
  pour la viande et les épices. Les ateliers commence à 10h, au fond de l'épicerie,
  thé à la menthe à volonté.",
  start_date: Date.new(2025, 6, 22),
  end_date: Date.new(2025, 6, 23)
)

puts "Created #{Event.count} events"


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
next if order.store.nil? || order.store.products.nil? || order.store.products.empty?
  Item.create!(
    order_id: order.id,
    product_id: order.store.products.sample.id,
    quantity: rand(1..10)
  )
end

puts "Created #{Item.count} items"

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
