# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.create!(name: "Item1", published:true, published_on: 1.day.ago, is_approved: true, image:'')
Item.create!(name: "Item2", published:true, published_on: 2.day.ago, is_approved: true, image:'')
Item.create!(name: "Item3", published:true, published_on: 3.day.ago, is_approved: true, image:'')