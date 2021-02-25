class ItemsController < ApplicationController
  # findメソッドをまとめる
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  # ログインしていないユーザーが許可されていないページへ遷移しようとすると、ログインページへリダイレクトする
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # ログイン状態の出品者以外のユーザーは、URLを直接入力して出品していない商品の商品情報編集ページへ遷移しようとすると、トップページに遷移する
  before_action :no_seller_move_to_index, only: [:edit, :update, :destroy]
  # 出品者・出品者以外にかかわらず、ログイン状態のユーザーが、URLを直接入力して売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移する
  before_action :login_user_move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  # 特定のitem情報の検索するコードをまとめる
  def set_item
    @item = Item.find(params[:id])
  end

  # 出品する情報の保存を許可する
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :category_id, :condition_id, :shipping_cost_id,
                                 :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  # ログイン状態の出品者以外のユーザーは、URLを直接入力して出品していない商品の商品情報編集ページへ遷移しようとすると、トップページに遷移する
  def no_seller_move_to_index
    redirect_to root_path if @item.user_id != current_user.id
  end

  # 出品者・出品者以外にかかわらず、ログイン状態のユーザーが、URLを直接入力して売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移する
  def login_user_move_to_index
    redirect_to root_path if @item.history.present?
  end
end
