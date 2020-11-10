require 'rails_helper'

RSpec.describe UserAddress, type: :model do
  describe '購入内容の保存' do
    before do
      @user_address = FactoryBot.build(:user_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_address).to be_valid
    end
    it '紐ずくuser_idがないと保存できないこと' do
      @user_address.user_id = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('Userを入力してください')
    end
    it '紐ずくitem_idがないと保存できないこと' do
      @user_address.item_id = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('Itemを入力してください')
    end
    it 'tokenがからでは保存出来ないこと' do
      @user_address.token = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('Tokenを入力してください')
    end
    it 'postcodeが空だと保存できないこと' do
      @user_address.postcode = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('郵便番号を入力してください')
    end
    it 'postcodeの記述にはハイフンがないと保存出来ないこと' do
      @user_address.postcode = 0o000000
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('郵便番号はハイフンを指定して下さい')
    end
    it 'prefecture_idが空だと保存できないこと' do
      @user_address.prefecture_id = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('都道府県を入力してください')
    end
    it 'cityが空だと保存できないこと' do
      @user_address.city = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('市区町村を入力してください')
    end
    it 'blockが空だと保存できないこと' do
      @user_address.block = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('番地を入力してください')
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_address.phone_number = nil
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('携帯番号を入力してください')
    end
    it 'phone_numberは12桁以上だと保存できないこと' do
      @user_address.phone_number = 0o00000000000
      @user_address.valid?
      expect(@user_address.errors.full_messages).to include('携帯番号は11桁以内で入力して下さい')
    end
  end
end
