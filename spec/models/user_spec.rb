require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: "", email: "test@example.com", password: "111aaa", first_name: "加藤", family_name: "弘樹", first_name_kana: "カトウ", family_name_kana: "ヒロキ", birth_day: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: "test", email: "", password: "111aaa", first_name: "加藤", family_name: "弘樹", first_name_kana: "カトウ", family_name_kana: "ヒロキ", birth_day: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

  end
end
