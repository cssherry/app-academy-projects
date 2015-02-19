class ContactsController < ApplicationController
  def index
    render json: Contact.where(user_id: params[:user_id])
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages #, status: :unprocessable_entity
    end
  end

  def show
    render json: Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    Contact.update(@contact.id, contact_params)
    if @contact.errors.empty?
      render json: @contact
    else
      render text: @contact.errors.full_messages
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    Contact.destroy(params[:id])
    render json: @contact
  end

  private
  def contact_params
    params[:contact].permit(:name, :email, :user_id)
  end
end
