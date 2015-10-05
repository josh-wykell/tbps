class Cart < ActiveRecord::Base
  has_many :sale_items
  has_many :sold_speaking_events, :through => :sale_items, :source => :sellable, :source_type => 'SpeakingEvent'

  def total_price
    sold_speaking_events.to_a.sum(&:price)     
  end

  def total_price_in_cents
    @cart.total_price * 100
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
