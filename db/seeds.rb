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
p 'Destroy issues'
Issue.destroy_all
p 'Destroy assignments'
Assignment.destroy_all

p 'Creating 7 tasks'


Task.create!(
    id: 1,
    name: 'Aspirateur',
    description: "Ne pas oublier la poussière derrière la télé !"
  )
Task.create!(
    id: 2,
    name: "Lave-vaisselle",
    description: "Vider le lave-vaisselle et pas dans l'évier hein ?! ;-)"
  )
Task.create!(
    id: 3,
    name: 'Courses',
    description: "Récupérer le panier de légumes"
  )
Task.create!(
    id: 4,
    name: 'Compost',
    description: "Vider le compost avant les moucherons XD"
  )
Task.create!(
    id: 5,
    name: 'Recyclage',
    description: "Alu, Pet, Carton & Chaussettes !"
  )
Task.create!(
    id: 6,
    name: 'Rangement fin de soirée',
    description: "Ranger le désordre des potes"
  )
Task.create!(
    id: 7,
    name: 'Micro-ondes',
    description: "Nettoyer les poils du micro-ondes"
  )

p 'Create a flat'


Flat.create!(
  id: 1,
  task_management: true,
  name: 'La Maison du Bonheur'
  )

p 'Create 3 User'

url_matt = 'https://res.cloudinary.com/dqktvdjkg/image/upload/v1559825707/61588994-09b3-4e80-b869-5ee64e1f8dc4-removebg_scprjx.png'
url_gio = 'https://res.cloudinary.com/dqktvdjkg/image/upload/v1559826372/giogio_dthzim.png'
url_lo = 'https://res.cloudinary.com/dqktvdjkg/image/upload/v1559826069/img_9806-removebg_iguouy.png'
lo = User.create!(
  id: 3,
  first_name: 'Loïc',
  last_name: 'Thurre',
  password: 'tototiti',
  password_confirmation: 'tototiti',
  email: 'loic.thurre@gmail.com',
  flat_id: 1
  )
lo.remote_avatar_photo_url = url_lo
lo.save


gio = User.create!(
  id: 2,
  first_name: 'Giovanni',
  last_name: 'Salcuni',
  password: 'tototiti',
  password_confirmation: 'tototiti',
  email: 'giovanni.salcuni12@gmail.com',
  flat_id: 1
  )

gio.remote_avatar_photo_url = url_gio
gio.save

matt = User.create(
  id: 1,
  first_name: 'Matthieu',
  last_name: 'Borgognon',
  password: 'bientotlapero',
  password_confirmation: 'bientotlapero',
  email: 'matrash@bqn.ch',
  flat_id: 1
  )
matt.remote_avatar_photo_url = url_matt
matt.save

p 'Create Assignments'

# 5.times do |i|
#     Assignment.create!(
#       user_id: rand(1..3),
#       task_id: i,
#       deadline: Date.today + rand(-2..5),
#       done_state: false
#     )
# end

# 3.times do |i|
#   Assignment.create!(
#       user_id: rand(1..3),
#       task_id: 5+i,
#       deadline: Date.today + rand(0..5),
#       done_state: true
#     )
# end

Assignment.create!(
  id: 1000,
  user_id: 1,
  task_id: 1,
  deadline: Date.today + rand(-3..-1),
  done_state: true
)

Assignment.create!(
  id: 1001,
  user_id: 2,
  task_id: 2,
  deadline: Date.today + rand(-3..-1),
  done_state: true
)

Assignment.create!(
  id: 1002,
  user_id: 3,
  task_id: 3,
  deadline: Date.today + 2,
  done_state: false
)

Assignment.create!(
  id: 1003,
  user_id: 3,
  task_id: 6,                                 # !!! Rangement potes
  deadline: Date.today + rand(0..5),
  done_state: false
)

Assignment.create!(
  id: 1004,
  user_id: 2,
  task_id: 7,                                 # !!! Micro-ondes
  deadline: Date.today + rand(-3..-1),
  done_state: false
)

Assignment.create!(
  id: 1005,
  user_id: 1,
  task_id: 4,                                 # !!! Compost
  deadline: Date.today,
  done_state: false
)

Assignment.create!(
  id: 1006,
  user_id: 2,
  task_id: 5,
  deadline: Date.today + rand(3..5),
  done_state: false
)

p 'Crate issues'

url_nespresso = "https://res.cloudinary.com/dqktvdjkg/image/upload/v1559138314/IMG_20190529_155105_m2iuyy.jpg"
url_microwave = "https://res.cloudinary.com/dqktvdjkg/image/upload/v1559138317/IMG_20190529_155143_yyi1d1.jpg"

nespresso = Issue.create!(
    user_id: 2,
    description: "Quand tu fais la fête avec tes copains, tu pourrais ranger derrière toi :-P",
    assignment_id: 1003
  )
nespresso.remote_photo_url = url_nespresso
nespresso.save


microwave = Issue.create!(
    user_id: 3,
    description: "Après avoir séché ton chien dans le micro-ondes, tu pourrais au moins le laver !",
    assignment_id: 1004
  )
microwave.remote_photo_url = url_microwave
microwave.save


p 'create deal'

Deal.create!(
  assignment_id:1002,
  assignment_proposal_id:1005,
  chosen: nil,
  description: "Hey, j'ai Démo Day au Wagon ce jour-là tu pourrais pas le faire pour moi !"
  )




