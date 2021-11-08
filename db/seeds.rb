# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Brewery.create(name: "Dr. Suds", location: "Portland, OR")
Brewery.create(name: "Lobrau", location: "Dusseldorf, Germany")
Brewery.create(name: "Valhalla", location: "Albany, NY")
Brewery.create(name: "Hopsville", location: "Portland, OR")
Brewery.create(name: "Brewski", location: "Denver, CO")

Beer.create(name: "Swill", style: "Pilsner", abv: 5.5, ibu: 30, brewery: Brewery.second)
Beer.create(name: "Delish", style: "Pale Ale", abv: 6.2, ibu: 50, brewery: Brewery.third)
Beer.create(name: "Snicklefritz", style: "Hazy IPA", abv: 7.8, ibu: 80, brewery: Brewery.first)
Beer.create(name: "Funkalicious", style: "Pale Ale", abv: 6.4, ibu: 58, brewery: Brewery.fourth)
Beer.create(name: "Ragnarok", style: "Imperial Stout", abv: 10.2, ibu: 45, brewery: Brewery.third)
Beer.create(name: "Juice Loosener", style: "Hazy IPA", abv: 5.9, ibu: 66, brewery: Brewery.first)
Beer.create(name: "Vampire Dust", style: "IPA", abv: 6.2, ibu: 55, brewery: Brewery.fifth)
Beer.create(name: "Bee's Knees", style: "Pale Ale", abv: 5.0, ibu: 50, brewery: Brewery.fifth)
Beer.create(name: "Testy", style: "Porter", abv: 5.9, ibu: 48, brewery: Brewery.third)
Beer.create(name: "Bat Cave", style: "Black Ale", abv: 6.7, ibu: 58, brewery: Brewery.first)
Beer.create(name: "Duff", style: "Lager", abv: 5.0, ibu: 34, brewery: Brewery.second)

styles = ["Pale Ale", "IPA", "Wheat Ale", "Porter", "Stout", "Pilsner"]

styles.each {|style| Style.create(name: style)}
