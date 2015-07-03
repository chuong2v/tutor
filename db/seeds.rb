# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
levels = [
  "Mau giao",
  "Lop 1",
  "Lop 2",
  "Lop 3",
  "Lop 4",
  "Lop 5",
  "Lop 6",
  "Lop 7",
  "Lop 8",
  "Lop 9",
  "Lop 10",
  "Lop 11",
  "Lop 12",
  "Luyen thi dai hoc",
  "Dai hoc"]

levels.each { |level| Level.create(level)}
