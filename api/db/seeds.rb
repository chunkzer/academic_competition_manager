# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env = "development"
  User.create(role_id: 1, name: 'Jose Armando', last_name: 'Account', email: 'administrator@yopmail.com')
  User.create(role_id: 2, name: 'Juan Jose', last_name: 'Account', email: 'student@yopmail.com')

  Event.create(name: "Concurso de Fisica",
                event_date: Time.now,
                registration_deadline: Time.now,
                description: 'Concurso de Fisica para estudiantes de preparatoria.'
              )

  Event.create(name: "Concurso de Matematicas",
               event_date: Time.now,
               registration_deadline: Time.now,
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

  EventSubscription.create(event_id: Event.find_by(name: "Concurso de Matematicas").id,
                          user_id: User.find_by(name: 'Jose Armando').id,
                          approved: false
                          )

  EventSubscription.create(event_id: Event.find_by(name: "Concurso de Fisica").id,
                          user_id: User.find_by(name: 'Juan Jose').id,
                          approved: false
                          )

  EventSubscription.create(event_id: Event.find_by(name: "Concurso de Fisica").id,
                          user_id: User.find_by(name: 'Juan Jose').id,
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
