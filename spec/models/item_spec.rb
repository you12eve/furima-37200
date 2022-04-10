require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品登録できる' do
      it '登録事項に問題なし' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できない' do
      it '画像が選択されていない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空' do
        @item.discription = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Discription can't be blank")
      end
      it '販売価格が空' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格に半角数字以外が含まれている場合は出品できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が300円未満では出品できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が9_999_999円を超えると出品できない' do
        @item.price = '999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'カテゴリーが未選択(1を選択している)' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が未選択(1を選択している)' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '発送料が未選択(1を選択している)' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '発送元の地域が未選択(1を選択している)' do
        @item.source_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Source can't be blank")
      end
      it '発送日の目安が未選択(1を選択している)' do
        @item.scheduled_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled day can't be blank")
      end
      it 'ユーザーと紐づいていない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
