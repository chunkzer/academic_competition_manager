# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env = "development"

  User.create(role_id: User.roles[:student],
              name: 'Jose Armando',
              last_name: 'Valencia Ramirez',
              email: 'student1@yopmail.com',
              password: '$2y$10$VohsaZwlcuFRjfLqabvi3u6QVFkjLu7phwChZlfhNIMKEOnS4oF6K'
              )

  User.create(role_id: User.roles[:tutor],
              name: 'Placido',
              last_name: 'Domingo',
              email: 'tutor1@yopmail.com',
              password: '$2y$10$VohsaZwlcuFRjfLqabvi3u6QVFkjLu7phwChZlfhNIMKEOnS4oF6K'
              )

  User.create(role_id: User.roles[:admin],
              name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: 'admin',
              password: '$2y$10$VohsaZwlcuFRjfLqabvi3u6QVFkjLu7phwChZlfhNIMKEOnS4oF6K'
              )

  5.times do
    User.create(role_id: User.roles[:admin],
                name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.safe_email,
                password: '$2y$10$VohsaZwlcuFRjfLqabvi3u6QVFkjLu7phwChZlfhNIMKEOnS4oF6K'
                )
  end

  25.times do
    User.create(role_id: User.roles[:student],
                name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.safe_email,
                password: '$2y$10$VohsaZwlcuFRjfLqabvi3u6QVFkjLu7phwChZlfhNIMKEOnS4oF6K'
                )
  end

 Event.create(name: "Concurso de Fisica",
               event_date: Time.now + 5.day,
               registration_deadline: Time.now + 5.day,
               description: 'Concurso de Fisica para estudiantes de preparatoria.'
               )

 Event.create(name: "Concurso de Matematicas",
               event_date: Time.now + 5.day,
               registration_deadline: Time.now + 5.day,
               description: 'Concurso de Matematicas para estudiantes de preparatoria.'
               )
 Event.create(name: "Concurso de Quimica",
              event_date: Time.now + 5.day,
              registration_deadline: Time.now + 5.day,
              description: 'Concurso de Matematicas para estudiantes de preparatoria.'
              )

  Requirement.create(description: "Copia de Acta de Nacimiento.", enabled: true, specifications: "N/A")
  Requirement.create(description: "Foto de frente.", enabled: true, specifications: "Sin lentes, gorras, etc...")
  Requirement.create(description: "Foto de IFE.", enabled: true, specifications: "Por ambos lados")


  EventRequirement.create(event_id: Event.find_by(name: "Concurso de Matematicas").id,
                          requirement_id: Requirement.find_by(description: "Copia de Acta de Nacimiento.").id
                          )
  EventRequirement.create(event_id: Event.find_by(name: "Concurso de Matematicas").id,
                          requirement_id: Requirement.find_by(description: "Foto de frente.").id
                          )
  EventRequirement.create(event_id: Event.find_by(name: "Concurso de Quimica").id,
                          requirement_id: Requirement.find_by(description: "Copia de Acta de Nacimiento.").id
                          )
  EventRequirement.create(event_id: Event.find_by(name: "Concurso de Quimica").id,
                          requirement_id: Requirement.find_by(description: "Foto de frente.").id
                          )


  subscriber_ids = User.where(role_id: 1).where.not(email: 'student1@yopmail.com').pluck(:id)
  subscriber_ids.shuffle.take(5).each do |subber_id|
    EventSubscription.create(event_id: Event.find_by(name: "Concurso de Fisica").id,
                             user_id: subber_id,
                             approved: true
                             )

    EventSubscription.create(event_id: Event.find_by(name: "Concurso de Matematicas").id,
                             user_id: subber_id,
                             approved: false
                            )

  end


  EventSubscription.create(event_id: Event.find_by(name: "Concurso de Fisica").id,
                          user_id: User.find_by(email: 'student1@yopmail.com').id,
                          approved: true
                          )

  EventSubscription.create(event_id: Event.find_by(name: "Concurso de Matematicas").id,
                          user_id: User.find_by(email: 'student1@yopmail.com').id,
                          approved: false
                          )

end
