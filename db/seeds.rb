# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

product_list = [
  [ "Tomate",         1,  1000,   1,  "Tomates frescos",            "Alimentos",  "verduras",           "Tomate.jpg" ],
  [ "Cebolla",        2,  800,    1,  "Cebolla blanca",             "Alimentos",  "verduras",           nil],
  [ "Leche Colanta",  3,  2200,   1,  "Leche entera de 1 litro ",   "Alimentos",  "productos diarios",  nil],
  [ "Huevos x12 ",    4,  8000,   1,  "Caja de 12 huevos.",         "Alimentos",  "productos diarios",  nil],
  [ "Trapero",        5,  10000,  1,  "Trapero simple",             "Aseo",       "utiles",             nil],
  [ "Escoba",         6,  10000,  1,  "Escoba simple",              "Aseo",       "utiles",             nil] 
]

Product.delete_all

product_list.each do |name, id, price, vendor, desc, cat, subcat, img|
  Product.create( name: name, pId: id ,price: price, vendorId: vendor, description: desc, category: cat, subcategory: subcat, image: img)
end


Vendor.delete_all

Vendor.create(
  shopname: "Mercado2GO",
  address: "CL22#22-22",
  email: "admin@mercado2go.com",
  encryped_password: "$2a$10$7de4fM5.MgrTqCp/WfQrIO1hOETqUGHF5xZYjKuHWwXlAl4EDyrVC",
  created_at: "2016-05-08 22:09:34.688826",
  updated_at: "2016-05-08 22:09:34.713863"
)
