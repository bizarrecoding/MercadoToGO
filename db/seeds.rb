# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

product_list = [
  [ "Tomate", 1, 1000, "null", "Tomates frescos" ],
  [ "Cebolla", 2, 800, "null", "Cebolla blanca"],
  [ "Leche Colanta", 3, 2200, "null", "Leche entera de 1 litro "],
  [ "Huevos x12 ", 4, 8000, "null", "Caja de 12 huevos." ]
]

product_list.each do |name, id, price, vendor, desc|
  Product.create( name: name, pid: id ,price: price, vendor: vendor, description: desc )
end
