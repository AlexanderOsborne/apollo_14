class Mission < ApplicationRecord
  has_many :astronaut_missions, dependent: :destroy
  has_many :astronauts, through: :astronaut_missions
  
  validates_presence_of :title, :time_in_space

  def self.mission_order
    order(:title)
  end
end
