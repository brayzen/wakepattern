# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

traits = Trait.create([
  { id: 1, name: 'helpful',        order: 1,  indent: 0 },
  { id: 2, name: 'dependable',     order: 2,  indent: 1 },
  { id: 3, name: 'productive',     order: 3,  indent: 1 },
  { id: 4, name: 'communication',  order: 4,  indent: 0 },
  { id: 5, name: 'listening',      order: 5,  indent: 1 },
  { id: 6, name: 'speech',         order: 6,  indent: 1 },
  { id: 7, name: 'understanding',  order: 7,  indent: 1 },
  { id: 8, name: 'charisma',       order: 8,  indent: 0 },
  { id: 9, name: 'friendliness',   order: 9,  indent: 1 },
  { id: 10, name: 'composure',     order: 10, indent: 1 },
  { id: 11, name: 'complainer',    order: 11, indent: 1 }
])
