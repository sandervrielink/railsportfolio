class Skill < ApplicationRecord
  include Placeholder
  
  validates_presence_of :titel, :percent_utilized
  after_initialize :set_defaults
  #wordt gestart wanneer de form is gemaakt. Direct daarna dus, na de def new in de portfolios_controller
  
  def set_defaults
    self.badge ||= Placeholder.image_generator(height: '250', width: '250')
  end
end
