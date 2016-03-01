class Speaker < ActiveRecord::Base
  has_many :speaking_events, :dependent => :destroy
end
