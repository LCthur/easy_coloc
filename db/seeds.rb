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
    id: 1,
    name: 'Aspirateur',
    description: "Aspirer la poussière"
  )
Task.create!(
    id: 2,
    name: "Lave-vaisselle",
    description: "Vider le lave-vaisselle"
  )
Task.create!(
    id: 3,
    name: 'Courses',
    description: "Faire les courses"
  )
Task.create!(
    id: 4,
    name: 'Compost',
    description: "vider le compost"
  )
Task.create!(
    id: 5,
    name: 'WC',
    description: "Laver les WC"
  )

p 'Create a flat'

Flat.create!(
  id: 1,
  task_management: true,
  name: 'Zero waste'
  )

p 'Create 4 User'

User.create!(
  id: 1,
  first_name: 'Toto',
  last_name: 'Titi',
  password: 'tototiti',
  password_confirmation: 'tototiti',
  email: 'toto@titi.com',
  flat_id: 1
  )

User.create!(
  id: 2,
  first_name: 'Giovanni',
  last_name: 'Salcuni',
  password: 'tototiti',
  password_confirmation: 'tototiti',
  email: 'giova@titi.com',
  flat_id: 1
  )

User.create!(
  id: 3,
  first_name: 'Matthieu',
  last_name: 'Borgognon',
  password: 'tototiti',
  password_confirmation: 'tototiti',
  email: 'matbgn@titi.com',
  flat_id: 1
  )


p 'Create Assignments'

10.times do 
    Assignment.create!(
      user_id: rand(1..3),
      task_id: rand(1..5),
      deadline: Date.today + rand(1..7),
      done_state: [true, false].sample

    )
    end
