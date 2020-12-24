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
  end
end