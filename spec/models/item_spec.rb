require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it 'image, item_name, item_explain, item_category_id, item_status_id, item_burden_id, item_prefeture_id, item_day_id, item_price, user_idが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('出品画像を入力してください')
      end
      it 'item_nameが空だと登録できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'item_explainが空だと登録できない' do
        @item.item_explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品説明を入力してください')
      end
      it 'item_categoryが空だと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
      end
      it 'item_categoryが1のときは登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end
      it 'item_statusが空だと登録できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください')
      end
      it 'item_statusが1のときは登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end
      it 'item_burdenが空だと登録できない' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end
      it 'item_burdenが1のときは登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
      end
      it 'item_prefectureが空だと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送先の地域を入力してください')
      end
      it 'item_prefectureが1のときは登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送先の地域は1以外の値にしてください')
      end
      it 'item_dayが空だと登録できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end
      it 'item_dayが1のときは登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
      end
      it 'item_priceが空だと登録できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end
      it 'item_priceの値が300未満かつ9,999,999以上だと登録できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格300以上9,999,999未満で入力して下さい')
      end
      it 'item_priceの値が10000000以上だと登録できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格300以上9,999,999未満で入力して下さい')
      end
      it 'item_priceは半角数字でないと保存できない' do
        @item.item_price = 'aiueo'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数字を使用して下さい')
      end
    end
  end
end
