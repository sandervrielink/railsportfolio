class Skill < ApplicationRecord
  validates_presence_of :titel, :percent_utilized
end
