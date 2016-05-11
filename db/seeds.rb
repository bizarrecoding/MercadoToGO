# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seeding DB"
product_list = [
  [ "Tomate",                 1000,   1,  "Tomates frescos",                "Verduras",  "verduras",            "Products/Tomate.jpg"    ],
  [ "Cebolla",                800,    2,  "Cebolla blanca",                 "Verduras",  "verduras",            "Products/cebolla.jpg"   ],  
  [ "Lechuga",                3800,   1,  "Lechuga batavia",                "Verduras",  "verduras",            "Products/lechuga.jpg"   ],
  [ "Zanahoria",              800,    2,  "Zanahoria 1Kg",                  "Verduras",  "verduras",            "Products/zanahoria.png" ],
  
  [ "Bananos",                2000,   1,  "Mano de bananos",                "Frutas",    "frutas",              "Products/bananos.jpg"   ],
  [ "Manzana",                1500,   1,  "Manzana roja ",                  "Frutas",    "frutas",              "Products/manzana.jpg"   ],
  [ "Coco",                   4200,   2,  "Coco tropical",                  "Frutas",    "frutas",              "Products/coco.jpg"      ],
  [ "Mango",                  4200,   2,  "Mango Tommy",                    "Frutas",    "frutas",              "Products/mango.jpg"     ],
  
  [ "Leche Colanta",          2200,   1,  "leche entera de 1 litro ",       "Alimentos",  "productos diarios",  "Products/leche.jpg"     ],
  [ "Leche Colanta x6L",      13200,  2,  "6 paquetes de leche entera",     "Alimentos",  "productos diarios",  "Products/leche_x6.jpg"  ],
  [ "Caja de huevos x12",     6200,   2,  "Caja de 12 huevos.",             "Alimentos",  "productos diarios",  "Products/eggs.jpg"      ],
  [ "Arroz florhuila",        3700,   1,  "Arroz florhuila 1Kg",            "Alimentos",  "productos diarios",  "Products/arroz.jpg"     ],
  
  [ "Trapero",                12000,  2,  "Trapero simple",                 "Aseo",       "utiles",             "Products/trapero.jpg"   ],
  [ "Escoba",                 11000,  1,  "Escoba simple",                  "Aseo",       "utiles",             "Products/escoba.png"    ],
  [ "Fabuloso 1L",            5600,   2,  "Limia pisos 1L",                 "Aseo",       "limpiador",          "Products/limpiador.jpg" ],
  [ "Clorox 1L",              5700,   1,  "Clorox 1L ",                     "Aseo",       "limpiador",          "Products/clorox.jpg"    ],
  
  [ "Set de cuchillos",       30000,  2,  "set de cuchillos de cocina",     "Utencilios", "utiles",             "Products/knifeset.jpg"  ],
  [ "Set de ollas",           40000,  2,  "set de ollas",                   "Utencilios", "utiles",             "Products/ollas.jpg"     ],
  [ "Platos plasticos",       28000,  1,  "Platos plasticos x20 unidades",  "Utencilios", "utiles",             "Products/platos.jpg"    ],

  [ "Cocacola",               3000,   1,  "Cocacola 2.5L no retornable",    "Bebidas",    "gaseosas",           "Products/cocacola.jpg"  ]  
]

Product.delete_all

product_list.each do |name, price, vendor, desc, cat, subcat, img|
  Product.create( name: name, price: price, vendor_id: vendor, description: desc, category: cat, subcategory: subcat, image: img)
end
puts "product_id starts from: #{Product.first.id}"

User.delete_all

user_list = [
  ["Heriberto",   "Vargas",     "CL79#57-60",   DateTime.now.to_date,   "herik@hotmail.com",      "12345678"],
  ["Eduardo",     "Ramirez",    "CL79#57-60",   DateTime.now.to_date,   "ededd@eddy.com",         "12345678"],
  ["Victor",      "Garrido",    "CR51#80-00",   DateTime.now.to_date,   "victor@hotmail.com",     "12345678"],
  ["Hernando",    "Angulo",     "CR55#80-00",   DateTime.now.to_date,   "trolazo@hotmail.com",    "12345678"],
  ["Sebastian",   "Burbano",    "CR77#55-00",   DateTime.now.to_date,   "sebastian@hotmail.com",  "12345678"],
  ["Yara",        "Gonzales",   "CR57#77-00",   DateTime.now.to_date,   "yara@hotmail.com",       "12345678"],
  ["Angelo",      "Manco",      "CR51B#79-00",  DateTime.now.to_date,   "angelo@hotmail.com",     "12345678"],
  ["Stefano",     "Manco",      "CR51B#79-00",  DateTime.now.to_date,   "stefano@hotmail.com",    "12345678"]
]

user_list.each do |name, secname, address, date_of_birth, email, password|
  User.create( name: name, secname: secname , address: address, date_of_birth: date_of_birth, email: email, password: password)
end

Vendor.delete_all

Vendor.create(
  shopname: "Mercado2GO",
  address: "CL22#22-22",
  email: "admin@mercado2go.com",
  password: "12345678" 
)
Vendor.create(
  shopname: "Ed Emporium ",
  address: "CL22#22-22",
  email: "edd@mercado2go.com",
  password: "12345678" 
)

puts "DB seeded"