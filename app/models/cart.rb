class Cart < ActiveRecord::Base
  has_many :sale_items
  has_many :speaking_events, :through => :sale_items
  has_one :cart_membership_status
  accepts_nested_attributes_for :cart_membership_status
  accepts_nested_attributes_for :sale_items, allow_destroy: true
  # validates :buyer_name, presence: true, :on => :update
  after_save :mark_cart_as_purchased

  def total_price
    sale_items.to_a.sum(&:subtotal)
  end

  def process_payment
    customer = Stripe::Customer.create email: email, card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: (total_price * 100).to_i,
                          description: sale_items.map(&:title).to_sentence,
                          currency: 'usd'
  end

  def mark_cart_as_purchased
    if card_token? && !purchased_at
      update_attribute(:purchased_at, Time.now)
    end
  end
end


