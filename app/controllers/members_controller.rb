class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]

  def index
    @members = Member.all
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
      params.require(:member).permit(:member_last_name, :member_first_name, :degree, :liscense_number, :home_address_street, 
                     :home_address_city, :home_address_state, :home_address_zip, :office_address_street, :office_address_city, 
                     :office_address_state, :office_address_zip, :email, :office_phone, :fax, :cell_phone, :home_phone, :birth_day,
                     :birth_month, :birth_year, :practice_specialities, :membership_type, :publish, :new_patients)
    end
end