class Mission < ApplicationRecord
  has_many :astronaut_missions, dependent: :destroy
  has_many :astronauts, through: :astronaut_missions
  
  validates_presence_of :title, :time_in_space

  def mission_order
    require 'pry'; binding.pry
    order(:title)
  end
end
