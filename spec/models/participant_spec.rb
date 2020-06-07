# frozen_string_literal: true

require 'rails_helper'

describe Participant do
  describe '#create' do
    context '有効なテスト' do
      it '全ての入力項目を入力' do
        participant = build(:participant)
        expect(participant).to be_valid
      end
    end

    context '無効なテスト' do
      it 'イベントの未選択' do
        participant = build(:participant, event: nil)
        participant.valid?
        expect(participant.errors[:event]).to include('を入力してください')
      end

      it '未ログイン' do
        participant = build(:participant, user: nil)
        participant.valid?
        expect(participant.errors[:user]).to include('を入力してください')
      end
    end
  end
end
