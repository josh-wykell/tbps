class Membership < ActiveRecord::Base
  belongs_to :member

  def membership_price
    if member.membership_type.   == "clinical"
      membership_price = 30000
    elsif member.membership_type == "academic"
      membership_price = 30000
    elsif member.membership_type == "corresponding"
      membership_price = 6000
    elsif member.membership_type == "student"
      membership_price = 3000
    elsif member.membership_type == "life"
      membership_price = 10000
    else member.membership_type  == "friend"
      membership_price = 6000
    end
    membership_price
  end

  def dues_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: membership_price,
                          description: 'TBPS Membership',
                          currency: 'usd'
  end
end
