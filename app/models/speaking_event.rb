class SpeakingEvent < ActiveRecord::Base
  belongs_to :speaker
  has_many :sale_items

  def to_s
    speaker_id
  end

end


