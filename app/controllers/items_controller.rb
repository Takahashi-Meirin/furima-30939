class ItemsController < ApplicationController
  # ログインしていないユーザーが許可されていないページへ遷移しようとすると、ログインページへリダイレクトする
  before_action :authenticate_user!, only: [:new, :create, :edit]
  # 出品者以外のログインユーザーが編集画面へ遷移しようとすると、トップページへリダイレクトする
  before_action :move_to_index, only: [:edit]

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
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  # 出品する情報の保存を許可する
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :category_id, :condition_id, :shipping_cost_id,
                                 :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

end
