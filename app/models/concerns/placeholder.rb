module Placeholder
  extend ActiveSupport::Concern
  #Maak er een helper van
  
  #De method hieronder is straks altijd aanspreekbaar via Placeholder.image_generator 
  def self.image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end  
end
