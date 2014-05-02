# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
brokers = [
  {name: 'John', image_path: 'm01.png'},
  {name: 'Sandra', image_path: 'f01.png'},
  {name: 'Mike', image_path: 'm02.png'},
  {name: 'Ann', image_path: 'f02.png'},
  {name: 'James', image_path: 'm03.png'},
  {name: 'Margaret', image_path: 'f03.png'}
]
Broker.create(brokers)
