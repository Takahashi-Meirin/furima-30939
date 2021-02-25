class OrdersController < ApplicationController
  before_action :set_item
  # ログインしていないユーザーが許可されていないページへ遷移しようとすると、ログインページへリダイレクトする
  before_action :authenticate_user!, only: [:index, :create]
  # ログイン状態のユーザーが、URLを直接入力して売却済み商品の商品購入ページへ遷移しようとするとトップページに遷移する
  before_action :login_user_move_to_index, only: [:index, :create]
  # ログイン状態の出品者が、URLを直接入力して自身の出品した商品購入ページに遷移しようとするとトップページに遷移する
  before_action :seller_move_to_index, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @user = current_user
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  # ログイン状態のユーザーが、URLを直接入力して売却済み商品の商品購入ページへ遷移しようとするとトップページに遷移する
  def login_user_move_to_index
    redirect_to root_path if @item.history.present?
  end

  # ログイン状態の出品者が、URLを直接入力して自身の出品した商品購入ページに遷移しようとするとトップページに遷移する
  def seller_move_to_index
    redirect_to root_path if current_user.id == @item.user.id
  end
end
