require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての値が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'hoge12'
        @user.password_confirmation = 'hoge12'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がない場合は登録できない' do
        @user.email = 'aaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '電話番号が空では登録できない' do
        @user.phone_number = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が英数混合では登録できない' do
        @user.phone_number = '0123456test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上では登録できない' do
        @user.phone_number = '090123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone number is invalid')
      end
      it '重複した電話番号が存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.phone_number = @user.phone_number
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Phone number has already been taken')
      end
    end
  end
end
