class Speaker < ActiveRecord::Base
  has_many :speaking_events
end
