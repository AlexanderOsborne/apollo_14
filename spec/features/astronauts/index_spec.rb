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
      niel = Astronaut.create!(name: 'Niel Armstrong', age: 37, job: 'Commander')
      buzz = Astronaut.create!(name: 'Buzz Aldrin', age: 32, job: 'Moonwalker')
      
      apollo = Mission.create!(title: 'Apollo', time_in_space: 16)
      gemini = Mission.create!(title: 'Gemini 7', time_in_space: 7)
      capricorn = Mission.create!(title: 'Capricorn 3', time_in_space: 57)

      visit "/astronauts"

      expect(apollo.title).to appear_before(capricorn.title)
      expect(capricorn.title).to appear_before(gemini.title)
    end
  end
end