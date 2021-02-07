class ItemsController < ApplicationController
  # findメソッドをまとめる
  before_action :set_item, only: [:edit, :show, :update]
  # ログインしていないユーザーが許可されていないページへ遷移しようとすると、ログインページへリダイレクトする
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  # 出品者以外のログインユーザーが編集画面へ遷移しようとすると、トップページへリダイレクトする
  before_action :move_to_index, only: [:edit, :update]

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

  # 出品者以外のログインユーザーが編集画面へ遷移しようとすると、トップページへリダイレクトする
  def move_to_index
    redirect_to action: :index unless @item.user_id == current_user.id
  end
end
