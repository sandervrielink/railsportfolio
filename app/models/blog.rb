class Blog < ApplicationRecord
  extend FriendlyId
  
  #gebruik de title als slug
  friendly_id :title, use: :slugged
end
