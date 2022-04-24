require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, item_id: item.id, price: item.price)
      sleep(0.1)
    end
  
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_delivery).to be_valid
      end

      it 'buildingは空でも保存できる' do
        @purchase_delivery.building = ''
        expect(@purchase_delivery).to be_valid
      end
    end
    
    context '内容に問題がある場合' do
      it 'tokenが空では保存できない' do
        @purchase_delivery.token = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_addressが空では保存できない' do
        @purchase_delivery.post_address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Post address can't be blank", "Post address is invalid. Include hyphen(-)")
      end
      it 'post_addressにハイフンが入っていないと保存できない' do
        @purchase_delivery.post_address = '1111111'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Post address is invalid. Include hyphen(-)")
      end
      it 'post_addressは半角数字以外は保存できない' do
        @purchase_delivery.post_address = '１１１ー１１１１'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Post address is invalid. Include hyphen(-)")
      end
      it 'source_idが空(1を選択する)だと保存できない' do
        @purchase_delivery.source_id = '1'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Source can't be blank")
      end
      it 'municipalityが空だと保存できない' do
        @purchase_delivery.municipality = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Municipality can't be blank", "Municipality is invalid")
      end
      it 'municipalityが全角かなカナ漢字以外だと保存できない' do
        @purchase_delivery.municipality = '11aaa'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Municipality is invalid")
      end
      it 'addressが空だと保存できない' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank", "Address is invalid")
      end
      it 'addressに記号が含まれていると保存できない' do
        @purchase_delivery.address = '**//'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address is invalid")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_delivery.phone_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberに半角数字以外が含まれていると保存できない' do
        @purchase_delivery.phone_number = '090????????'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが10文字以下だと保存できない' do
        @purchase_delivery.phone_number = '090000'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end