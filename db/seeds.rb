# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Astronaut.destroy_all
Mission.destroy_all

niel = Astronaut.create!(name: 'Niel Armstrong', age: 37, job: 'Commander')
buzz = Astronaut.create!(name: 'Buzz Aldrin', age: 32, job: 'Moonwalker')

apollo = Mission.create!(title: 'Apollo', time_in_space: 16)
gemini = Mission.create!(title: 'Gemini 7', time_in_space: 7)
capricorn = Mission.create!(title: 'Capricorn 3', time_in_space: 57)

AstronautMission.create!(astronaut_id: niel.id, mission_id: apollo.id)
AstronautMission.create!(astronaut_id: buzz.id, mission_id: apollo.id)
AstronautMission.create!(astronaut_id: buzz.id, mission_id: gemini.id)
AstronautMission.create!(astronaut_id: niel.id, mission_id: gemini.id)
AstronautMission.create!(astronaut_id: buzz.id, mission_id: capricorn.id)
