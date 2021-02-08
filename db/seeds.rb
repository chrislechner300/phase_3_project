# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Beer.create([
  { name: 'Fat Tire', style: 'Amber', brewery: 'New Belgium', sample_date: Date.today },
  { name: 'Blood Orange', style: 'DIPA', brewery: 'Rails End', sample_date: Date.yesterday },
  { name: 'Miller Lite', style: 'Pilsner', brewery: 'Miller', sample_date: Date.yesterday },
  ])