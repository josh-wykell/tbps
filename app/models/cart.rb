class Cart < ActiveRecord::Base
  has_many :sale_items
  has_many :sold_speaking_events, :through => :sale_items, :source => :sellable, :source_type => 'SpeakingEvent'
  after_save :mark_cart_as_purchased

  def total_price
    sellables.to_a.sum(&:regular_price)     
  end

  def sellables
    sale_items.map(&:sellable)
  end

  def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: (total_price * 100).to_i,
                          description: sellables.map(&:title).to_sentence,
                          currency: 'usd'
  end

  def mark_cart_as_purchased
    if card_token? && !purchased_at
      update_attribute(:purchased_at, Time.now)
    end
  end
end
