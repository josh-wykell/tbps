class Cart < ActiveRecord::Base
  has_many :sales
  # has_many :sold_speakers, :through => :sales, :source => :sellable, :source_type => 'Speaker'
  #gotoleaf model
  def paypal_url(return_path)
    values = {
        business: "merchant@gotealeaf.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: course.price,
        item_name: course.name,
        item_number: course.id,
        quantity: '1'
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

  #railscast model
  def total_price
    # convert to array so it doesn't try to do sum on database directly
    line_items.to_a.sum(&:full_price)
  end
  
  def paypal_url(return_url, notify_url)
    values = {
      :business => 'seller_1229899173_biz@railscasts.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url
    }
    line_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.unit_price,
        "item_name_#{index+1}" => item.product.name,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => item.quantity
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
