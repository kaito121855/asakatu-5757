## ASAKATU
**朝活に特化したタスク管理もできるSNSアプリです。**  

http://ec2-18-178-189-147.ap-northeast-1.compute.amazonaws.com/  

[![Image from Gyazo](https://i.gyazo.com/b9f8e486cc1db993d059b3c15a0dae6f.gif)](https://gyazo.com/b9f8e486cc1db993d059b3c15a0dae6f)


## アプリ概要  
＜　アプリのコンセプト　＞  
* 朝活仲間を作り、お互いのモチベーションやタスクの達成率をあげる。
* タスクを管理・記録できるようにすることで、可視化しやすくする。

　基本的には、twitterのような投稿、コメント、いいね、検索、フォロー機能のあるSNSアプリですが、その他に以下のような特徴のあるアプリです。

* その日投稿したタスクを一覧で確認できる
* タスクの達成を記録することできる
* 達成数のランキング機能


## 作成背景
**朝の時間を有効活用して1日を有意義に過ごしたい**と思ったのがきっかけです。しかし、朝活を始めるにあたって以下の様々な課題に直面しました。
 
* 早起きするのが難しい
* 早起きできても、ダラダラと過ごしてしまう
* モチベーションが維持できない
* 継続できない

この課題を解決するために次のようなことをしました。

* みんチャレを利用した朝活チームの参加
* Twitterを利用して朝やることを投稿

その結果少しずつですが朝活を継続できるようになりました。このことから**朝活仲間と作ること**、**朝やることをSNS上で宣言すること**は朝活をやる上で重要なことだと感じました。

こうした経験から、自分と同じように朝活に苦労している人をサポートできるアプリを作成したいと思いこのテーマにしました。


## 工夫点
* その日投稿したタスクを一覧で確認できるようにしたこと。
* タスクの達成を記録できるようにしたこと。
* 投稿数・達成数・達成時間の合計を確認できるようにしたこと。
* 1日毎の達成数をグラフで確認できるようにしたこと。
* 達成数のユーザーランキング機能


## 機能一覧

#### ユーザー管理機能（devise,S3） 
* ログイン・ログアウト機能 
* フォロー機能
[![Image from Gyazo](https://i.gyazo.com/41d5a8bdabf1e7050b0bc09c945a8030.gif)](https://gyazo.com/41d5a8bdabf1e7050b0bc09c945a8030)

[![Image from Gyazo](https://i.gyazo.com/329b1179f54685c7def6404b2d685108.gif)](https://gyazo.com/329b1179f54685c7def6404b2d685108)

#### タスク投稿機能
* タスク投稿・詳細・編集・削除機能
* いいね機能（非同期）  
[![Image from Gyazo](https://i.gyazo.com/5c91c169b6726b307606b9ccdd5de17a.gif)](https://gyazo.com/5c91c169b6726b307606b9ccdd5de17a)

[![Image from Gyazo](https://i.gyazo.com/083b2ca30e27136997e57868437a8fa8.gif)](https://gyazo.com/083b2ca30e27136997e57868437a8fa8)

#### ランキング機能
* 達成数ランキング  
[![Image from Gyazo](https://i.gyazo.com/3669831cc5cbb9b336f0e1fd0cd86c8f.gif)](https://gyazo.com/3669831cc5cbb9b336f0e1fd0cd86c8f)

#### タスク検索機能
* タスク名検索機能  
* カテゴリー別検索機能
[![Image from Gyazo](https://i.gyazo.com/ba6f3d0140073097b131d17690b07e53.gif)](https://gyazo.com/ba6f3d0140073097b131d17690b07e53)

#### タスク管理機能
* 今日のタスク一覧の表示  
* 達成機能
[![Image from Gyazo](https://i.gyazo.com/7a199c2183a23ca357d1c7ce80734ca6.gif)](https://gyazo.com/7a199c2183a23ca357d1c7ce80734ca6)

#### タスク記録機能
* タスク数・達成数・達成時間計・1週間の達成数（chartkick）の表示
[![Image from Gyazo](https://i.gyazo.com/1c1b8a74ab91d67352bb3c381191b5d1.gif)](https://gyazo.com/1c1b8a74ab91d67352bb3c381191b5d1)


## ER図
[![Image from Gyazo](https://i.gyazo.com/e45f0c33c9a817305ef222b7365ff718.png)](https://gyazo.com/e45f0c33c9a817305ef222b7365ff718)


## 環境・使用技術
#### フロントエンド
* HTML/CSS/jQuery/FontAwesome

#### バックエンド
* Ruby'2.6.5'/Ruby on Rails'6.0.0'

#### テストコード
* Rspec/FactoryBot/Faker

#### 本番環境
* AWS(VPC,EC2,S3)
* アプリケーションサーバー(Unicorn)
* Webサーバー(Nginx)
* データベース(mariaDB)
* 自動デプロイ(Capistrano3)

## 今後の実装予定
* Docker/Docker-compose  
　同じ開発環境を簡単に構築できたり、開発環境における差異を最小化できるなどのたくさんのメリットを感じています。

* CircleCIの導入  
　ビルドやテストのプロセスを自動化することができるなどヒューマンエラーがなくすことができるため導入を予定しています。
