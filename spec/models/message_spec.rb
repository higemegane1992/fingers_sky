# frozen_string_literal: true

require 'rails_helper'

describe Message do
  describe '#create' do
    context '有効なテスト' do
      it '全ての入力項目を入力' do
        message = build(:message)
        expect(message).to be_valid
      end
    end

    context '無効なテスト' do
      it '送信先の未選択' do
        message = build(:message, event: nil)
        message.valid?
        expect(message.errors[:event]).to include('を入力してください')
      end

      it '件名の未入力' do
        message = build(:message, subject: nil)
        message.valid?
        expect(message.errors[:subject]).to include('を入力してください')
      end

      it '本文の未入力' do
        message = build(:message, body: nil)
        message.valid?
        expect(message.errors[:body]).to include('を入力してください')
      end

      it '未ログイン' do
        message = build(:message, user: nil)
        message.valid?
        expect(message.errors[:user]).to include('を入力してください')
      end
    end
  end
end
