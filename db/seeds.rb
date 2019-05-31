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
    name: 'Recyclage',
    description: "Alu, Pet, Carton "
  )
Task.create!(
    id: 6,
    name: 'Rangement soirée',
    description: "Ranger le désordre de la soirée"
  )
Task.create!(
    id: 7,
    name: 'Micro-ondes',
    description: "Laver le micro-ondes"
  )

p 'Create a flat'


Flat.create!(
  id: 1,
  task_management: true,
  name: 'Zero waste'
  )

p 'Create 4 User'

url_matt = 'https://res.cloudinary.com/dqktvdjkg/image/upload/v1559036382/amsv3groux8hkv0v2jdg_qoddk9.jpg'
url_gio = 'https://res.cloudinary.com/dqktvdjkg/image/upload/v1559036382/rxvmw8qn1hve9gmi4enu_kvznhk.jpg'
url_lo = 'https://res.cloudinary.com/dqktvdjkg/image/upload/v1559036382/ufnku3qnuo2heeauakdm_p5jxyh.jpg'
lo = User.create!(
  id: 1,
  first_name: 'Toto',
  last_name: 'Titi',
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
  id: 3,
  first_name: 'Matthieu',
  last_name: 'Borgognon',
  password: 'tototiti',
  password_confirmation: 'tototiti',
  email: 'mattrach@gmail.com',
  flat_id: 1
  )
matt.remote_avatar_photo_url = url_matt
matt.save

p 'Create Assignments'

5.times do
    Assignment.create!(
      user_id: rand(1..3),
      task_id: rand(1..5),
      deadline: Date.today + rand(-2..5),
      done_state: true
    )
end

3.times do
  Assignment.create!(
      user_id: rand(1..3),
      task_id: rand(1..5),
      deadline: Date.today + rand(0..5),
      done_state: true
    )
end

Assignment.create!(
  id: 1000,
  user_id: 1,
  task_id: 6,
  deadline: Date.today + rand(-3..5),
  done_state: true
)

Assignment.create!(
  id: 1001,
  user_id: 1,
  task_id: 7,
  deadline: Date.today + rand(-3..5),
  done_state: true
)

Assignment.create!(
  id: 1002,
  user_id: 2,
  task_id: 2,
  deadline: Date.today + rand(0..5),
  done_state: false
)

Assignment.create!(
  id: 1003,
  user_id: 1,
  task_id: 7,
  deadline: Date.today + rand(0..5),
  done_state: false
)

Assignment.create!(
  id: 1004,
  user_id: 1,
  task_id: 2,
  deadline: Date.today + rand(0..5),
  done_state: false
)

p 'Crate issues'

url_nespresso = "https://res.cloudinary.com/dqktvdjkg/image/upload/v1559138314/IMG_20190529_155105_m2iuyy.jpg"
url_microwave = "https://res.cloudinary.com/dqktvdjkg/image/upload/v1559138317/IMG_20190529_155143_yyi1d1.jpg"

nespresso = Issue.create!(
    user_id: 2,
    description: "T'as pas rangé les gobelets en carton !",
    assignment_id: 1000
  )
nespresso.remote_photo_url = url_nespresso
nespresso.save


microwave = Issue.create!(
    user_id: 2,
    description: "Le micro-onde n'est pas lavé correctement",
    assignment_id: 1001
  )
microwave.remote_photo_url = url_microwave
microwave.save


p 'create deal'

Deal.create!(
  assignment_id:1002,
  assignment_proposal_id:1003,
  chosen: nil,
  description: "Je ne suis pas là"
  )

Deal.create!(
  assignment_id:1002,
  assignment_proposal_id:1004,
  chosen: nil,
  description: "Je ne suis pas là"
  )




