require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "全てのデータが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに@がないと登録できないこと" do
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordは6文字以上で、英数字の組み合わせであれば登録できること" do
      @user.password = "123abc"
      @user.password_confirmation = "123abc"
      expect(@user).to be_valid
    end

    it "passwordは5文字以下では登録できないこと" do
      @user.password = "123ab"
      @user.password_confirmation = "123ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが英文字のみでは登録できないこと" do
    end

    it "passwordが数字のみでは登録できないこと" do
    end

    it "password_confirmationが空だと登録できないこと" do
    end

    it "passwordとpassword_confirmationのデータが一致しなければ登録できないこと" do
      @user.password = "123abc"
      @user.password_confirmation = "123abcd"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "family_nameが空では登録できないこと" do
    end

    it "first_nameが空では登録できないこと" do
    end

    it "family_nameは全角でなければ登録できないこと" do
    end

    it "first_nameは全角でなければ登録できないこと" do
    end

    it "family_name_kanaが空では登録できないこと" do
    end

    it "first_name_kanaが空では登録できないこと" do
    end

    it "family_name_kanaは全角カタカナでなければ登録できないこと" do
    end

    it "first_name_kanaは全角カタカナでなければ登録できないこと" do
    end

    it "birth_dayが空では登録できないこと" do
    end

  end
end
