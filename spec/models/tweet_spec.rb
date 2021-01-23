require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '投稿の保存' do
    context '投稿が保存できる場合' do
      it 'タスク名・ジャンル・開始時間（時）・開始時間（分）・終了時間（時）・終了時間（分）・詳細が存在すれば保存される' do
        expect(@tweet).to be_valid
      end
      it '詳細が存在しなくても投稿は保存できる' do
        @tweet.detalis = ''
        expect(@tweet).to be_valid
      end
    end

    context 'ツイートが保存できない場合' do
      it 'タスク名がないとツイートは保存できない' do
        @tweet.task = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('タスク名を入力してください')
      end
      it 'ジャンルが「1」だと保存できない' do
        @tweet.category_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('ジャンルは「---」以外のものを選択してください')
      end
      it '開始時間（時）が「時」だと保存できない' do
        @tweet.start_hour_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('開始時間（時）は「時」以外のものを選択してください')
      end
      it '開始時間（分）が「分」だと保存できない' do
        @tweet.start_minute_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('開始時間（分）は「分」以外のものを選択してください')
      end
      it '開始時間（時）が「時」だと保存できない' do
        @tweet.end_hour_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('終了時間（時）は「時」以外のものを選択してください')
      end
      it '開始時間（分）が「分」だと保存できない' do
        @tweet.end_minute_id = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('終了時間（分）は「分」以外のものを選択してください')
      end
    end
  end
end
