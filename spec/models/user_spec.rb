require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it '＠のないemailは登録できない' do
      @user.email = 'aaa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '0a0a0'
      @user.password_confirmation = '0a0a0'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it '半角英数字が混合でないpasswordは登録できないこと_1' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid Input both half-width characters and numbers')
    end
    it '半角英数字が混合でないpasswordは登録できないこと_2' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid Input both half-width characters and numbers')
    end
    it 'password_confirmationがpasswordに一致しない場合、登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空の場合登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角文字で入力してください')
    end
    it 'first_nameが全角で入力されていない場合登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角文字で入力してください')
    end
    it 'family_nameが空の場合登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name 全角文字で入力してください')
    end
    it 'family_nameが全角で入力されていない場合登録できない' do
      @user.family_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name 全角文字で入力してください')
    end
    it 'first_name_kanaが空の場合登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角カタカナで入力してください')
    end
    it 'first_name_kanaが全角(カタカナ)で入力されていない場合登録できない' do
      @user.first_name_kana = 'あ朝'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角カタカナで入力してください')
    end
    it 'family_name_kanaが空の場合登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana 全角カタカナで入力してください')
    end
    it 'family_name_kanaが全角(カタカナ)で入力されていない場合登録できない' do
      @user.family_name_kana = 'あ朝'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana 全角カタカナで入力してください')
    end
    it 'birth_dayが空の場合登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
