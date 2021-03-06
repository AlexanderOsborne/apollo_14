require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit the index page' do

    it 'I see a list of astronaughts with attributes' do
      niel = Astronaut.create!(name: 'Niel Armstrong', age: 37, job: 'Commander')
      buzz = Astronaut.create!(name: 'Buzz Aldrin', age: 32, job: 'Moonwalker')

      visit "/astronauts"

      expect(page).to have_content(niel.name)
      expect(page).to have_content(buzz.name)
      expect(page).to have_content(buzz.age)
      expect(page).to have_content(niel.age)
      expect(page).to have_content(niel.job)
      expect(page).to have_content(buzz.job)
    end

    it 'I see average age of all astronauts' do
      niel = Astronaut.create!(name: 'Niel Armstrong', age: 37, job: 'Commander')
      buzz = Astronaut.create!(name: 'Buzz Aldrin', age: 32, job: 'Moonwalker')

      visit "/astronauts"

      expect(page).to have_content(Astronaut.average_age)
    end

    it 'I see all mission each astronaut participated in alphabetical order' do
      buzz = Astronaut.create!(name: 'Buzz Aldrin', age: 32, job: 'Moonwalker')
      
      apollo = Mission.create!(title: 'Apollo', time_in_space: 16)
      gemini = Mission.create!(title: 'Gemini 7', time_in_space: 7)
      capricorn = Mission.create!(title: 'Capricorn 3', time_in_space: 57)

      AstronautMission.create!(astronaut_id: buzz.id, mission_id: apollo.id)
      AstronautMission.create!(astronaut_id: buzz.id, mission_id: gemini.id)
      AstronautMission.create!(astronaut_id: buzz.id, mission_id: capricorn.id)
      
      visit "/astronauts"
      save_and_open_page
      expect(apollo.title).to appear_before(gemini.title)
      expect(capricorn.title).to appear_before(gemini.title)
    end

    it 'I see total mission time for each astronaut' do
      buzz = Astronaut.create!(name: 'Buzz Aldrin', age: 32, job: 'Moonwalker')
      
      apollo = Mission.create!(title: 'Apollo', time_in_space: 16)
      gemini = Mission.create!(title: 'Gemini 7', time_in_space: 7)

      AstronautMission.create!(astronaut_id: buzz.id, mission_id: apollo.id)
      AstronautMission.create!(astronaut_id: buzz.id, mission_id: gemini.id)
      
      visit "/astronauts"
      
      expect(page).to have_content(23)
    end
  end
end