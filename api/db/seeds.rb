# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env = "development"

  User.create(role_id: 1,
              name: 'Jose Armando',
              last_name: 'Valencia Ramirez',
              email: 'student1@yopmail.com',
              password: '$2y$10$VohsaZwlcuFRjfLqabvi3u6QVFkjLu7phwChZlfhNIMKEOnS4oF6K'
              )

  User.create(role_id: 1,
              name: 'Juan Jose',
              last_name: 'Spyros Refrän',
              email: 'student2@yopmail.com',
              password: '$2y$10$VohsaZwlcuFRjfLqabvi3u6QVFkjLu7phwChZlfhNIMKEOnS4oF6K'
              )

  User.create(role_id: 2,
              name: 'Adrianvo',
              last_name: 'Unison',
              email: 'adrianvo@yopmail.com',
              password: '$2y$10$VohsaZwlcuFRjfLqabvi3u6QVFkjLu7phwChZlfhNIMKEOnS4oF6K'
              )
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

  Requirement.create(description: "Copia de Acta de Nacimiento.")
  Requirement.create(description: "Foto de frente.")

  EventRequirement.create(event_id: Event.find_by(name: "Concurso de Matematicas").id,
                          requirement_id: Requirement.find_by(description: "Copia de Acta de Nacimiento.").id
                          )
  EventRequirement.create(event_id: Event.find_by(name: "Concurso de Matematicas").id,
                          requirement_id: Requirement.find_by(description: "Foto de frente.").id
                          )

  EventSubscription.create(event_id: Event.find_by(name: "Concurso de Fisica").id,
                          user_id: User.find_by(name: 'Jose Armando').id,
                          approved: false
                          )

  EventSubscription.create(event_id: Event.find_by(name: "Concurso de Fisica").id,
                          user_id: User.find_by(name: 'Juan Jose').id,
                          approved: false
                          )

  EventSubscription.create(event_id: Event.find_by(name: "Concurso de Matematicas").id,
                          user_id: User.find_by(name: 'Juan Jose').id,
                          approved: false
                          )

  Document.create(event_id: Event.find_by(name: "Concurso de Matematicas").id,
                    user_id: User.find_by(name: 'Juan Jose').id,
                    requirement_id: Requirement.find_by(description: "Copia de Acta de Nacimiento.").id,
                    approved: false
                   )

  Document.create(event_id: Event.find_by(name: "Concurso de Matematicas").id,
                   user_id: User.find_by(name: 'Juan Jose').id,
                   requirement_id: Requirement.find_by(description: "Foto de frente.").id,
                   approved: false
                  )

  Document.create(event_id: Event.find_by(name: "Concurso de Fisica").id,
                   user_id: User.find_by(name: 'Juan Jose').id,
                   requirement_id: Requirement.find_by(description: "Copia de Acta de Nacimiento.").id,
                   approved: false
                  )

  Document.create(event_id: Event.find_by(name: "Concurso de Fisica").id,
                    user_id: User.find_by(name: 'Jose Armando').id,
                    requirement_id: Requirement.find_by(description: "Copia de Acta de Nacimiento.").id,
                    approved: false
                  )

end
