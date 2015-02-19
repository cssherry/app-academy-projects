class ContactSharesController < ApplicationController

  def create
    @contact_share = ContactShare.new(contact_share_param)
    if @contact_share.save
      render json: @contact_share
    else
      render text: @contact_share.errors.full_messages
    end
  end

  def destroy
    @contact_share = ContactShare.find(params[:id])
    ContactShare.destroy(params[:id])
    render json: @contact_share
  end

  private
  def contact_share_param
    params[:contact_share].permit(:user_id, :contact_id)
  end
end
