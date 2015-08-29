class Cart < ActiveRecord::Base
  has_many :sale_items
  has_many :sold_speaking_events, :through => :sale_items, :source => :sellable, :source_type => 'SpeakingEvent'

  def total_price
    # convert to array so it doesn't try to do sum on database directly
    sold_speaking_events.to_a.sum(&:price)     #(&:full_price)
  end
  
  # def paypal_url(return_url, notify_url)
  #   values = {
  #     :business => 'seller_1229899173_biz@railscasts.com',
  #     :cmd => '_cart',
  #     :upload => 1,
  #     :return => return_url,
  #     :invoice => id,
  #     :notify_url => notify_url
  #   }
  #   line_items.each_with_index do |item, index|
  #     values.merge!({
  #       "amount_#{index+1}" => item.unit_price,
  #       "item_name_#{index+1}" => item.product.name,
  #       "item_number_#{index+1}" => item.id,
  #       "quantity_#{index+1}" => item.quantity
  #     })
  #   end
  #   "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  # end
end
