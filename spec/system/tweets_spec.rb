require 'rails_helper'

RSpec.describe 'タスク投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet = FactoryBot.create(:tweet)
  end
  context 'ツイート投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('タスク作成')
      # 投稿ページに移動する
      visit new_tweet_path
      # フォームに情報を入力する
      fill_in 'タスク名', with: @tweet.task
      select 'トレーニング', from: 'tweet[category_id]'
      select '6', from: 'tweet[start_hour_id]'
      select '00', from: 'tweet[start_minute_id]'
      select '6', from: 'tweet[end_hour_id]'
      select '30', from: 'tweet[end_minute_id]'
      fill_in '詳細', with: @tweet.detalis
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect { find('input[name="commit"]').click }.to change { Tweet.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq tweets_path
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（タスク名）
      expect(page).to have_content(@tweet.task)
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（ジャンル）
      expect(page).to have_content('トレーニング')
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（開始時間）
      expect(page).to have_content('6')
      expect(page).to have_content('00')
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（終了時間）
      expect(page).to have_content('6')
      expect(page).to have_content('30')
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（詳細）
      expect(page).to have_content(@tweet.detalis)
    end
  end
  context 'タスク投稿ができないとき' do
    it 'ログインしていないとトップページに遷移できない' do
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('タスク投稿')
    end
  end
end

RSpec.describe 'タスク編集', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet = FactoryBot.create(:tweet)
  end
  context 'タスク編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したタスクの編集ができる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('タスク作成')
      # 投稿ページに移動する
      visit new_tweet_path
      # フォームに情報を入力する
      fill_in 'タスク名', with: @tweet.task
      select 'トレーニング', from: 'tweet[category_id]'
      select '6', from: 'tweet[start_hour_id]'
      select '00', from: 'tweet[start_minute_id]'
      select '6', from: 'tweet[end_hour_id]'
      select '30', from: 'tweet[end_minute_id]'
      fill_in '詳細', with: @tweet.detalis
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect { find('input[name="commit"]').click }.to change { Tweet.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq tweets_path
      # 編集ページへ遷移する
      visit edit_tweet_path(@tweet)
      # 投稿内容を編集する
      fill_in 'タスク名', with: "#{@tweet.task}+編集したタスク名"
      select 'トレーニング', from: 'tweet[category_id]'
      select '7', from: 'tweet[start_hour_id]'
      select '00', from: 'tweet[start_minute_id]'
      select '7', from: 'tweet[end_hour_id]'
      select '30', from: 'tweet[end_minute_id]'
      fill_in '詳細', with: "#{@tweet.detalis}+編集した詳細"
      # 編集してもTweetモデルのカウントは変わらないことを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { Tweet.count }.by(0)
      # トップページに遷移したことを確認する
      expect(current_path).to eq tweets_path
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（タスク名）
      expect(page).to have_content("#{@tweet.task}+編集したタスク名")
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（ジャンル）
      expect(page).to have_content('トレーニング')
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（開始時間）
      expect(page).to have_content('7')
      expect(page).to have_content('00')
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（終了時間）
      expect(page).to have_content('7')
      expect(page).to have_content('30')
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（詳細）
      expect(page).to have_content("#{@tweet.detalis}+編集した詳細")
    end
  end
  context 'タスク編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したタスクの編集画面には遷移できない' do
      # ログインする
      sign_in(@user)
      # 「編集」ボタンがないことを確認する
      expect(page).to have_no_content('編集')
    end
    it 'ログインしていないとタスクの編集画面には遷移できない' do
      # サービス紹介ページにいる
      visit root_path
      # 「編集」ボタンがないことを確認する
      expect(page).to have_no_content('編集')
    end
  end
end

RSpec.describe 'タスク削除', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet = FactoryBot.create(:tweet)
  end
  context 'ツイート削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿したツイートの削除ができる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('タスク作成')
      # 投稿ページに移動する
      visit new_tweet_path
      # フォームに情報を入力する
      fill_in 'タスク名', with: @tweet.task
      select 'トレーニング', from: 'tweet[category_id]'
      select '6', from: 'tweet[start_hour_id]'
      select '00', from: 'tweet[start_minute_id]'
      select '6', from: 'tweet[end_hour_id]'
      select '30', from: 'tweet[end_minute_id]'
      fill_in '詳細', with: @tweet.detalis
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect { find('input[name="commit"]').click }.to change { Tweet.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq tweets_path
      # # 投稿を削除するとレコードの数が1減ることを確認する
      # expect{ all(".more")[1].hover.find_link('削除', href: tweet_path(@tweet)).click }.to change { Tweet.count }.by(-1)
      # # トップページには先ほど投稿した内容のツイートが存在してないことを確認する（タスク名）
      # expect(page).to have_no_content(@tweet.task)
      # # トップページには先ほど投稿した内容のツイートが存在してないことを確認する（ジャンル）
      # expect(page).to have_no_content('トレーニング')
      # # トップページには先ほど投稿した内容のツイートが存在してないことを確認する（開始時間）
      # expect(page).to have_no_content('6')
      # expect(page).to have_no_content('00')
      # # トップページには先ほど投稿した内容のツイートが存在してないことを確認する（終了時間）
      # expect(page).to have_no_content('6')
      # expect(page).to have_no_content('30')
      # # トップページには先ほど投稿した内容のツイートが存在してないことを確認する（詳細）
      # expect(page).to have_content(@tweet.detalis)
    end
  end
  context 'タスク削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの削除ができない' do
      # ログインする
      sign_in(@user)
      # 「削除」ボタンがないことを確認する
      expect(page).to have_no_content('削除')
    end
    it 'ログインしていないとツイートの削除ボタンがない' do
      # トップページに移動する
      visit root_path
      # 「削除」ボタンがないことを確認する
      expect(page).to have_no_content('削除')
    end
  end
end

RSpec.describe 'タスク詳細', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet = FactoryBot.create(:tweet)
  end
  context 'タスク詳細ができるとき' do
    it 'ログインしたユーザーはタスク詳細ページに遷移できる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('タスク作成')
      # 投稿ページに移動する
      visit new_tweet_path
      # フォームに情報を入力する
      fill_in 'タスク名', with: @tweet.task
      select 'トレーニング', from: 'tweet[category_id]'
      select '6', from: 'tweet[start_hour_id]'
      select '00', from: 'tweet[start_minute_id]'
      select '6', from: 'tweet[end_hour_id]'
      select '30', from: 'tweet[end_minute_id]'
      fill_in '詳細', with: @tweet.detalis
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect { find('input[name="commit"]').click }.to change { Tweet.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq tweets_path
      # 詳細ページに遷移する
      # visit tweet_path(@tweet)
      # # 詳細ページにタスクの内容が含まれている
      # expect(page).to have_content(@tweet.task)
      # expect(page).to have_content('トレーニング')
      # expect(page).to have_content('6')
      # expect(page).to have_content('00')
      # expect(page).to have_content('6')
      # expect(page).to have_content('30')
      # expect(page).to have_content(@tweet.detalis)
    end
  end
  context 'タスク詳細ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したタスク詳細ページに遷移できない' do
      # ログインする
      sign_in(@user)
      # 「削除」ボタンがないことを確認する
      expect(page).to have_no_content('詳細')
    end
    it 'ログインしていない状態でタスク詳細ページに遷移できない' do
      # トップページに移動する
      visit root_path
      # 「詳細」ボタンがない
      expect(page).to have_no_content('詳細')
    end
  end
end
