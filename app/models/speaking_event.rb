class SpeakingEvent < ActiveRecord::Base
  belongs_to :speaker
  has_many :sale_items, as: :sellable
end


#test