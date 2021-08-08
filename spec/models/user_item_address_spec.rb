require 'rails_helper'

RSpec.describe UserItemAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_item_address = FactoryBot.build(:user_item_address,item_id:item.id, token:"tok_0000000000", user_id: user.id)
      sleep 0.1 
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_item_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @user_item_address.building_name= ''
        expect(@user_item_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numberが空だと保存できないこと' do
        @user_item_address.post_number = ''
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberが全角数字だと保存できないこと' do
        @user_item_address.post_number = '１２３ー１２３４'
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it 'post_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_item_address.post_number = '1231234'
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @user_item_address.prefectures_id = ''
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @user_item_address.city = ''
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @user_item_address.address = ''
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @user_item_address.phone_number = ''
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @user_item_address.phone_number = '０９０５５６７３３２１'
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it 'tokenが空だと保存できないこと' do
        @user_item_address.token = ''
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_id' do
        @user_item_address.item_id = ''
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_id' do
        @user_item_address.user_id = ''
        @user_item_address.valid?
        expect(@user_item_address.errors.full_messages).to include("User can't be blank")
      end
    
   end
  end
end