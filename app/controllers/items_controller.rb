class ItemsController < ApplicationController
  # ログインしていないユーザーが商品出品ページへ遷移しようとすると、ログインページへリダイレクトする
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  # 出品する情報の保存を許可する
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :category_id, :condition_id, :shipping_cost_id,
                                 :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
