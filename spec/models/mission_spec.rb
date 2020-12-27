require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe "class methods" do
    it 'self.mission order' do
      niel = Astronaut.create!(name: 'Niel Armstrong', age: 37, job: 'Commander')
      gemini = Mission.create!(title: 'Gemini 7', time_in_space: 7)
      apollo = Mission.create!(title: 'Apollo', time_in_space: 16)
      AstronautMission.create!(astronaut_id: niel.id, mission_id: gemini.id)
      AstronautMission.create!(astronaut_id: niel.id, mission_id: apollo.id)

     expect(Mission.mission_order).to eq([apollo,gemini])
    end
  end
end
