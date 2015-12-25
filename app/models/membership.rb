class Membership < ActiveRecord::Base
  belongs_to :member

  def membership_charge
    if member.membership_type.   == "clinical"
      membership_price = 30000
    elsif member.membership_type == "corresponding"
      membership_price = 6000
    elsif member.membership_type == "student"
      membership_price = 3000
    elsif member.membership_type == "friend"
      membership_price = 6000
    else member.membership_type == "life"
      membership_price = 10000
    end
    if member.donation
      membership_price + ((member.donation*100).to_i) 
    else
      membership_price
    end
  end

  def dues_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: membership_charge,
                          description: 'TBPS Membership',
                          currency: 'usd'
  end
end
