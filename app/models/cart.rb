class Cart < ActiveRecord::Base
  has_many :sale_items
  has_many :sold_speaking_events, :through => :sale_items, :source => :sellable, :source_type => 'SpeakingEvent'
  after_create :mark_cart_as_purchased

  def total_price
    sold_speaking_events.to_a.sum(&:price)     
  end

  def total_price_in_cents
    @cart.total_price * 100
  end

  def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: cart.total_price * 100,
                          description: cart.sellable.name,
                          currency: 'usd'
  end

  def mark_cart_as_purchased
    if @cart.card_token?  
      cart.update_attribute(:purchased_at, Time.now)
    end
  end
  # def paypal_url(return_url)
  #   values = {
  #     :business => 'tbypsychoanalytic-facilitator@gmail.com',
  #     :cmd => '_cart',
  #     :upload => 1,
  #     :return => return_url,
  #     :invoice => id,
  #     :notify_url => "8e00953c.ngrok.io/payment_notifications"
  #   }
  #   sale_items.each_with_index do |item, index|
  #     values.merge!({
  #       "amount_#{index+1}" => item.sellable.price,
  #       "item_name_#{index+1}" => item.sellable.speaker.name,
  #       "item_number_#{index+1}" => item.sellable.id,
  #       "quantity_#{index+1}" => 1
  #     })
  #   end
  #   "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  # end
end
