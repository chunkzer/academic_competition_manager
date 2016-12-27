# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env = "development"
  User.create(role_id: 1, name: 'Administrator', last_name: 'Account', email: 'administrator@yopmail.com')
  User.create(role_id: 2, name: 'Student', last_name: 'Account', email: 'student@yopmail.com')

end

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

EventRequirement.create(event_id: Event.find_by(name: "Concurso de Matematicas"),
                        requirement_id: Requirement.find_by(description: "Copia de Acta de Nacimiento")
                        )
