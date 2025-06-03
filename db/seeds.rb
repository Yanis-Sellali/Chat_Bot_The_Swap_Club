# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
user1 = User.create!(
nom: "David B",
email: "david.b@example.com",
localisation: "Paris"
)

user2 = User.create!(
nom: "Clarence S"
email: "clarence@example.com",
localisation: "Milan"
)

Maillot.create!(
name: "Maillot Domicile 2022",
team: "Paris Saint-Germain",
flocking: "Mbappé 7",
year: 2022,
description: "Maillot domicile du PSG porté durant la saison 2021-2022.",
image: "",
user: user1
)

Maillot.create!(
name: "Maillot Coupe du monde 1998",
team: "France",
flocking: "Zidane 10",
year: 1998,
description: "Maillot domicile de l’équipe de France durant la Coupe du Monde 1998.",
image: “” ,
user: user2
)

Maillot.create!(
name: "Maillot Coupe du monde 1998",
team: "France",
flocking: "Henry 12",
year: 1998,
description: "Maillot domicile de l’équipe de France durant la Coupe du Monde 1998.",
image: "",
user: user2
)

Maillot.create!(
name: "Maillot Domicile 2025",
team: "Paris Saint-Germain",
flocking: "Dembélé 10",
year: 2025,
description: "Maillot ligue des champions domicile du PSG porté durant la saison 2024-2025 floqué Dembélé 10",
image: "",
user: user1
)

Maillot.create!(
name: "Maillot domicile 1981",
team: "Paris Saint-Germain",
year: 1981,
description: "Maillot historique du PSG saison 1981-82 avec le 1er trophée du club, la coupe de France remportée face au St Etienne de Michel Platini",
image: "",
user: user1
)

Maillot.create!(
name: "Maillot Domicile 2001",
team: "Paris Saint-Germain",
flocking: "Ronaldinho 21",
year: 2001,
description: " Maillot domicile du PSG lors de la première saison de Ronaldinho",
image: "",
user: user1
)

Maillot.create!(
name: "Maillot Domicile 1995-1996",
team: "Paris Saint-Germain",
year: 1995,
description: "Maillot historique du PSG saison 1995-96 avec la première coupe d’Europe du club, la coupe d’Europe des vainqueurs de coupe",
image: "",
user: user1
)

Maillot.create!(
name: "Maillot exterieur 2006:2007",
team: "Paris Saint-Germain",
year: 2006,
description: "maillot vintage extérieur du PSG 2006/2007, style Louis Vuitton. Les petits logos du PSG (Tour Eiffel, PSG et fleur de lys) sont incrustés au maillot ",
image: "",
user: user1
)

Maillot.create!(
name: "Maillot exterieur 2006/2007",
team: "Paris Saint-Germain",
year: 2006,
description: "maillot vintage extérieur du PSG 2006/2007, style Louis Vuitton. Les petits logos du PSG (Tour Eiffel, PSG et fleur de lys) sont incrustés au maillot.",
image: "",
user: user1
)

Maillot.create!(
name: "Maillot domicile 1994-95",
team: "Paris Saint-Germain",
year: 1994,
description: "maillot vintage domicile du PSG 1994/1995 pour la première demis de Ligue des Champions du club avec des légendes comme Weah, Rai ou Ginola",
image: "",
user: user1
)

Maillot.create!(
name: "Maillot Domicile 2007/2008",
team: "Paris Saint-Germain",
flocking: "Pauleta 9",
year: 2007,
description: "Maillot domicile du PSG 2007/2008 de la légende Pauleta avec qui ils remporteront la Coupe de la Ligue.",
image: "",
user: user1
)

Maillot.create!(
name: "Maillot domicile coupe du monde 2006",
team: "Equipe de France",
flocking: "Ribéry 22",
year: 2006,
description: "Maillot domicile de l'équipe de France lors de la Coupe du Monde 2006 floqué Ribéry",
image: "",
user: user2
)

Maillot.create!(
name: "Maillot domicile Euro 2000",
team: "Equipe de France",
flocking: "Trezeguet 20",
year: 2000,
description: "Maillot domicile de l'équipe de France de l’Euro 2000 floqué Trezeguet",
image: "",
user: user2
)

Maillot.create!(
name: "Maillot domicile 1982",
team: "Equipe de France",
year: 1982,
description: "Maillot domicile de l'équipe de France de la coupe du monde 1982",
image: "",
user: user2
)

Maillot.create!(
name: "Maillot domicile coupe du monde 2018",
team: "Equipe de France",
year: 2018,
description: "Maillot domicile de l'équipe de France de la coupe du monde 2018 deux étoiles",
image: "",
user: user2
)
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
