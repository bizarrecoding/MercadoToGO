# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

product_list = [
  [ "Tomate", 1, 1000, 0, "Tomates frescos", "Tomate.jpg" ],
  [ "Cebolla", 2, 800, 0, "Cebolla blanca", nil],
  [ "Leche Colanta", 3, 2200, 0, "Leche entera de 1 litro ", nil],
  [ "Huevos x12 ", 4, 8000, 0, "Caja de 12 huevos.", nil]
]

Product.delete_all

product_list.each do |name, id, price, vendor, desc, img|
  Product.create( name: name, pId: id ,price: price, vendorId: vendor, description: desc, image: img)
end

