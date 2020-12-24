class AstronautMission < ApplicationRecord
  belongs_to :astronaut
  belongs_to :mission

  delegate :title, to: :mission
end
