class MailingListsController < ApplicationController

  def new
    @mailing_list = MailingList.new
  end

  def create
    @mailing_list = MailingList.create(mailing_list_params)
    if @mailing_list.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def mailing_list_params
    params.require(:mailing_list).permit(:first_name, :last_name, :email)
  end
end
