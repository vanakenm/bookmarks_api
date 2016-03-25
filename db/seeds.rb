# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

data = JSON.parse(File.read("db/data.json")).with_indifferent_access

data[:categories].each do |raw_category|
  Category.create(raw_category)
end

data[:bookmarks].each do |raw_bookmark|
  category = Category.find(raw_bookmark[:category])
  raw_bookmark[:category] = category
  Bookmark.create(raw_bookmark)
end