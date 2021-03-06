# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'


url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_ingredients = open(url).read

ingredients = JSON.parse(serialized_ingredients)

ingredients = ingredients["drinks"]

Ingredient.delete_all

puts 'Creating ingredients...'
ingredients.each { |ingredient|
  ingredient_name = ingredient["strIngredient1"]
  new_ingredient = Ingredient.new( name: ingredient_name)
  new_ingredient.save!
  }
puts 'Finished!'
