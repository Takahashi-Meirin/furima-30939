class OrdersController < ApplicationController

  def index
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else 
        render 'index'
    end
  end

  private

  def destination_params
    params.require(:order).permit(:post_code, :municipality, :address, :building, :phone_number, :prefecture_id, :histpry_id, :user_id, :item_id)
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
