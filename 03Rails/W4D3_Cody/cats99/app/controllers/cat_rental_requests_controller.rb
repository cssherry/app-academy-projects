class CatRentalRequestsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @cat_rental_requests = CatRentalRequest.all
    @heading = 'All Cat Rental Requests'
    render :index
  end

  def show
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @heading = "Cat rental request ##{@cat_rental_request.id}"
    render :show
  end

  def edit
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @heading = "Edit cat rental request ##{@cat_rental_request.id}"
    render :edit
  end

  def new
    cat_param = params[:cat_id].nil? ? {} : {cat_id: params[:cat_id]}
    @cat_rental_request = CatRentalRequest.new(cat_param)
    @heading = 'Create new cat request'
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_req_params)
    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      flash.now[:errors] = @cat_rental_request.errors.full_messages
      @heading = 'Create new cat request'
      render :new
    end
  end

  def update
    @cat_rental_request = CatRentalRequest.find(params[:id])
    if @cat_rental_request.update(cat_req_params)
      redirect_to @cat_rental_request
    else
      flash.now[:errors] = @cat_rental_request.errors.full_messages
      @heading = "Edit cat rental request ##{@cat_rental_request.id}"
      render :edit
    end
  end

  def approve!
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.approve!
    redirect_to cat_url(@cat_rental_request.cat_id)
  end

  def deny!
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.deny!
    redirect_to cat_url(@cat_rental_request.cat_id)
  end

  private

  def cat_req_params
    parameters = params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
    parameters[:user_id] = current_user.id
    parameters
  end
end
