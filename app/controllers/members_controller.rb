class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    @members = Member.all.order(:member_last_name)
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    if @member.save
      redirect_to new_member_membership_path(@member)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to @member, notice: 'Your member profile has been updated'
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def member_payment
    @member = Member.find(params[:id])
  end

  private

    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:member_last_name, :member_first_name, :degree, :mailing_address_street, 
                     :mailing_address_city, :mailing_address_state, :mailing_address_zip, :office_address_street, :office_address_city, 
                     :office_address_state, :office_address_zip, :email, :office_phone, :fax, :cell_phone, :home_phone, :birth_date,
                     :practice_specialities, :membership_type, :publish, :new_patients, :liscense, :donation)
    end
end
