class OrdersController < ApplicationController

  def index
    @destination = Destination.new
  end

  def create
    binding.pry
    @destination = Destination.new(destination_params)
    if @destination.valid?
      pay_item
      @destination.save
      return redirect_to root_path
    else 
        render 'index'
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: destination_params[:price],
      card: destination_params[:token],
      currency: 'jpy'
    )
  end

end
