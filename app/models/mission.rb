class Mission < ApplicationRecord
  has_many :astronaut_missions, dependent: :destroy
  has_many :astronauts, through: :astronaut_missions
  
  validates_presence_of :title, :time_in_space

  def self.mission_order
    order(:title)
  end

  def self.total_time
    sum(:time_in_space)
  end
end
