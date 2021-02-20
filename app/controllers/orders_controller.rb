class OrdersController < ApplicationController
  # ログインしていないユーザーが許可されていないページへ遷移しようとすると、ログインページへリダイレクトする
  before_action :authenticate_user!, only: [:create]
  # 出品者以外のログインユーザーが購入画面へ遷移しようとすると、トップページへリダイレクトする
  before_action :move_to_index, only: [:create]

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @user = current_user
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :municipality, :address, :building, :phone_number, :prefecture_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    # PAY.JPテスト秘密鍵
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      # 商品の値段
      amount: @item.price,
      # カードトークン
      card: order_params[:token],
      # 通過の種類
      currency: 'jpy'
    )
  end

  # 出品者以外のログインユーザーが編集画面へ遷移しようとすると、トップページへリダイレクトする
  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item.user_id != current_user.id
  end
end
