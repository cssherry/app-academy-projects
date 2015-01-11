class CatRentalRequestsController < ApplicationController
  def index
    @cat_rental_requests = CatRentalRequest.all
    render :index
  end

  def show
    @cat_rental_request = CatRentalRequest.find(params[:id])
    render :show
  end

  def edit
    @cat_rental_request = CatRentalRequest.find(params[:id])
    render :edit
  end

  def new
    cat_param = params[:cat_id].nil? ? {} : {cat_id: params[:cat_id]}
    @cat_rental_request = CatRentalRequest.new(cat_param)
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_req_params)
    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      flash.now[:errors] = @cat_rental_request.errors.full_messages
      render :new
    end
  end

  def update
    @cat_rental_request = CatRentalRequest.find(params[:id])
    if @cat_rental_request.update(cat_req_params)
      redirect_to @cat_rental_request
    else
      flash.now[:errors] = @cat_rental_request.errors.full_messages
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
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end
end
