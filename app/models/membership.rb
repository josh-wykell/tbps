class Membership < ActiveRecord::Base
  belongs_to :member

  def dues_payment
    @amount = 500
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: @amount,
                          description: 'TBPS Membership',
                          currency: 'usd'
  end
end
