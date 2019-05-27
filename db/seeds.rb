# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Destroy tasks'
Task.destroy_all
p 'Destroy Users'
User.destroy_all
p 'Destroy flats'
Flat.destroy_all

p 'Creating 5 tasks'

Task.create!(
    name: 'Aspirateur',
    description: "Aspirer la poussière"
  )
Task.create!(
    name: "Lave-vaisselle",
    description: "Vider le lave-vaisselle"
  )
Task.create!(
    name: 'Courses',
    description: "Faire les courses"
  )
Task.create!(
    name: 'Compost',
    description: "vider le compost"
  )
Task.create!(
    name: 'WC',
    description: "Laver les WC"
  )

p 'Create a flat'

Flat.create!(
  id: 1,
  task_management: true,
  name: 'Zero waste'
  )

p 'Create a User'

User.create!(
  first_name: 'Toto',
  last_name: 'Titi',
  password: 'tototiti',
  password_confirmation: 'tototiti',
  email: 'toto@titi.com',
  flat_id: 1
  )














