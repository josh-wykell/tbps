class SaleItem < ActiveRecord::Base
  belongs_to :speaking_event
  belongs_to :cart
  validates :cart_id, presence: true

  def subtotal
    unit_price * quantity
  end

  def title
    speaking_event.speaker.name
  end
end
