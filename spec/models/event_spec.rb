# frozen_string_literal: true

require 'rails_helper'

describe Event do
  describe '#create' do
    context '有効なテスト' do
      it '全ての入力項目を入力' do
        event = build(:event)
        expect(event).to be_valid
      end

      it '画像の未入力' do
        event = build(:event, image: nil)
        expect(event).to be_valid
      end
    end

    context '無効なテスト' do
      it 'タイトルの未入力' do
        event = build(:event, title: nil)
        event.valid?
        expect(event.errors[:title]).to include('を入力してください')
      end

      it '概要の未入力' do
        event = build(:event, description: nil)
        event.valid?
        expect(event.errors[:description]).to include('を入力してください')
      end

      it '日時の未入力' do
        event = build(:event, date: nil)
        event.valid?
        expect(event.errors[:date]).to include('を入力してください')
      end

      it '開催場所の未入力' do
        event = build(:event, address: nil)
        event.valid?
        expect(event.errors[:address]).to include('を入力してください')
      end

      it '未ログイン' do
        event = build(:event, user: nil)
        event.valid?
        expect(event.errors[:user]).to include('を入力してください')
      end
    end
  end
end
