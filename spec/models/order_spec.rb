require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    # インスタンスを生成する処理に0.1秒待機させてread_timeoutのエラーを回避するための記述
    sleep 0.1
  end

  context '保存ができる時' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end
    it 'builingは空でも保存できること' do
      @order.building = ''
      expect(@order).to be_valid
    end
  end

  context '保存ができない時' do
    it 'post_codeが空だと保存できないこと' do
      @order.post_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeに半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order.post_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code is invalid")
    end
    it 'municipalityが空だと保存できないこと' do
      @order.municipality = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberがハイフン不要で11桁以内でないと保存できないこと' do
      @order.phone_number = '123456789101'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'prefecture_idが1だと保存できないこと' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it 'userが紐づいていないと保存できないこと' do
      @order.user_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐づいていないと保存できないこと' do
      @order.item_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
  end

end
