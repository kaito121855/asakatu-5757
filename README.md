## ASAKATU
**朝活に特化したタスク管理もできるSNSアプリです。**  

http://ec2-18-178-189-147.ap-northeast-1.compute.amazonaws.com/  

[![Image from Gyazo](https://i.gyazo.com/c3e282a3c16a339bdd71aebcccc1db27.gif)](https://gyazo.com/c3e282a3c16a339bdd71aebcccc1db27)


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
[![Image from Gyazo](https://i.gyazo.com/8ec60c7d74654c878250dead8d4f6893.gif)](https://gyazo.com/8ec60c7d74654c878250dead8d4f6893)

[![Image from Gyazo](https://i.gyazo.com/a020663f3bf5d9e36410b3a59dc052fc.gif)](https://gyazo.com/a020663f3bf5d9e36410b3a59dc052fc)

#### タスク投稿機能
* タスク投稿・詳細・編集・削除機能
* いいね機能（非同期）  
[![Image from Gyazo](https://i.gyazo.com/644b861422a6591b202cd8b4673ca142.gif)](https://gyazo.com/644b861422a6591b202cd8b4673ca142)

[![Image from Gyazo](https://i.gyazo.com/855c624e541a52c2dcf51d4e447df537.gif)](https://gyazo.com/855c624e541a52c2dcf51d4e447df537)

#### タスク検索機能
* タスク名検索機能  
* カテゴリー別検索機能
[![Image from Gyazo](https://i.gyazo.com/25aea92803093b75338070be3c8bd641.gif)](https://gyazo.com/25aea92803093b75338070be3c8bd641)

#### タスク管理機能
* 今日のタスク一覧の表示  
* 達成機能
[![Image from Gyazo](https://i.gyazo.com/085dd703ba58a5bbb34ccc1da4da00af.gif)](https://gyazo.com/085dd703ba58a5bbb34ccc1da4da00af)

#### タスク記録機能
* タスク数・達成数・達成時間計・1週間の達成数（chartkick）の表示
[![Image from Gyazo](https://i.gyazo.com/103710cac15df9bc75343311e0360fba.gif)](https://gyazo.com/103710cac15df9bc75343311e0360fba)


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
