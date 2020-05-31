# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe '#create' do
    context '有効なテスト' do
      it '全ての入力項目を入力' do
        user = build(:user)
        expect(user).to be_valid
      end

      it '６文字以上のパスワード' do
        user = build(:user, password: '000000', password_confirmation: '000000')
        expect(user).to be_valid
      end
    end

    context '無効なテスト' do
      it '姓の未入力' do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include('を入力してください')
      end

      it '名の未入力' do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include('を入力してください')
      end

      it 'メールアドレスの未入力' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end

      it 'メールアドレスの重複' do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include('はすでに存在します')
      end

      it 'パスワードの未入力' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end

      it '５文字以下のパスワード' do
        user = build(:user, password: '00000', password_confirmation: '00000')
        user.valid?
        expect(user.errors[:password]).to include('は6文字以上で入力してください')
      end

      it '確認用パスワードの未入力' do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include('を入力してください')
      end

      it 'ユーザーネームの未入力' do
        user = build(:user, user_name: nil)
        user.valid?
        expect(user.errors[:user_name]).to include('を入力してください')
      end

      it 'ユーザーネームの重複' do
        user = create(:user)
        another_user = build(:user, user_name: user.user_name)
        another_user.valid?
        expect(another_user.errors[:user_name]).to include('はすでに存在します')
      end
    end
  end
end
