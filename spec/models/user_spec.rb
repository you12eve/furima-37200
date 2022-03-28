require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "内容に問題なし" do
      it '正常に作動' do
        expect(@user).to be_valid
      end
    end

    context "内容に問題あり" do
      it 'nickname:必須' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      it "email:必須" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it "password:必須" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it "passwordとpassword_confirmationが不一致" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "last_name:必須" do
        @user.last_name =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
  
      it "last_kana:必須" do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
  
      it "first_name:必須" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it "first_kana:必須" do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
  
      it "birthday:必須" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
  
      it "email:@必須" do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
  
      it "email:一意性" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
  
      it "password:6文字以上" do
        @user.password = "11a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
  
      it "password:半角英数字混合必須①(半角数字のみ)" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
  
      it "password:半角英数字混合必須②(半角英字のみ)" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
  
      it "password:半角英数字混合必須③(全角大文字を含むパスワード)" do
        @user.password = 'ａｂｃＤＥＦＧ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
  
      it "last_name:全角(漢字・カナ・かな)必須" do
        @user.last_name =  'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
  
      it "last_kana:全角(カナ)必須"  do
        @user.last_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid')
      end
  
      it "first_name:全角(漢字・カナ・かな)必須" do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
  
      it "first_kana:全角(カナ)必須" do
        @user.first_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
    end
  end
end