require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品登録' do
    context '新規商品登録ができる場合' do
      it '全て入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規商品登録ができない場合' do
      it '画像が入力されていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が入力されていないと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が入力されていないと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが選択されていないと登録できない' do
        @item.category_id =  1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が選択されていないと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が選択されていないと登録できない' do
        @item.postage_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage type can't be blank")
      end
      it '発送元の地域が選択されていないと登録できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '発送までの日数が選択されていないと登録できない' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end
      it '価格が入力されていないと登録できない' do
        @item.value = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Value can't be blank")
      end
      it '価格が半角数字以外登録できない' do
        @item.value = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not included in the list')
      end
      it '価格が300以下の場合登録できない' do
        @item.value = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not included in the list')
      end
      it '価格が9999999以上の場合登録できない' do
        @item.value = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not included in the list')
      end
    end
  end
end
