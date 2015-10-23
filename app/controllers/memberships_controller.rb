class MembershipsController < ApplicationController

  def new
    member = Member.find(params[:member_id])
    @membership = member.memberships.build
  end

  def create
    member = Member.find(params[:member_id])
    @membership = member.memberships.create(membership_params.merge(email: stripe_params["stripeEmail"],
                                                               card_token: stripe_params["stripeToken"]))
    raise "Please, membership errors" unless @membership.valid?
    @membership.dues_payment
    @membership.save
    flash[:notice] = 'Thank You for being a Tampa Bay Psychoanalytic Society member.'
    
    rescue Stripe::CardError => e
    flash[:error] = e.message
  end

  private

    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end

    def membership_params
      params.require(:membership).permit(:purchased_at, :member_id)
    end
end
