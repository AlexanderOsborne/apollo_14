require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class methods' do
    it 'self.average_age' do
      niel = Astronaut.create!(name: 'Niel Armstrong', age: 37, job: 'Commander')
      buzz = Astronaut.create!(name: 'Buzz Aldrin', age: 32, job: 'Moonwalker')

      expect(Astronaut.average_age).to eq(34.5)
    end
  end
end
