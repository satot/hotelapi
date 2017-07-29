# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Supplier.create([
  {name: "supplier1", url: "https://api.myjson.com/bins/2tlb8"},
  {name: "supplier2", url: "https://api.myjson.com/bins/42lok"},
  {name: "supplier3", url: "https://api.myjson.com/bins/15ktg"}
])
