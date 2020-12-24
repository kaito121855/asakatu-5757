## ASAKATU

![ASAKATU](https://user-images.githubusercontent.com/70756110/102959281-6293f380-4522-11eb-8aa6-ecce9e124324.gif)

![e28c129bda4abba8ba55d46331d662f2](https://user-images.githubusercontent.com/70756110/102965267-d937ed80-4530-11eb-906e-f726704f21f6.gif)

## アプリケーション概要

　ユーザーが同士が朝に行うタスクを宣言し合い、タスクを達成率をあげるためのアプリケーションとなっています。また、タスクを投稿できるだけでなく、todoリストのようにその日投稿したタスクを管理できたり、タスク数やタスク達成数などを閲覧できるページも作成しました。

## App URL

## 作成背景
　私は、プログラミング学習を始めると同時に朝活も一緒に始めました。理由としては、朝の時間を有効活用して1日を有意義にしたいと思ったからです。しかし、朝活を始めるにあたって多くの問題にぶつかりました。それは、**「そもそも朝早くに起きることが難しい」「朝早く起きてもダラダラと過ごしてしまう」「継続するのが難しい」**というものでした。またこの問題は他の朝活をしている人なども共通する問題だと思いました。そこで、todoリストのようなものをお互いが宣言することでこの問題を少しでも解決できるのではないかと思いこのテーマにしました。

## 機能一覧

#### ユーザー管理機能
* ログイン機能（devise）
![e96860246289890b08bcfc2ccbfed492](https://user-images.githubusercontent.com/70756110/103066195-b32b4f80-45fb-11eb-937d-782c62270d20.gif)

* マイページ
![acde8c890935adcb591f158457b7e4f7](https://user-images.githubusercontent.com/70756110/102969445-11432e80-4539-11eb-8985-717a46d1a9f2.gif)

* フォロー機能（非同期）
![8fab37d2c35017446ef07c05d9dd2012](https://user-images.githubusercontent.com/70756110/102967518-785ee400-4535-11eb-9500-f94c11fa3d51.gif)

* フォロー・フォロワーページ
![9851f7e8578183e37def021a0e1856d3](https://user-images.githubusercontent.com/70756110/102969695-7dbe2d80-4539-11eb-96c7-4fadb3dcc9de.gif)

#### タスク投稿機能（ログインユーザーのみ）
* タスク新規投稿（active_hash）
![00c14c2e9f4856b40bb7e10b81819034](https://user-images.githubusercontent.com/70756110/102967937-5154e200-4536-11eb-9fd9-82713fd5f387.gif)

* タスクの詳細（コメント機能付き）
![2af913cc68bf6de0e171aa62d800c8f3](https://user-images.githubusercontent.com/70756110/102968150-b27cb580-4536-11eb-88dc-42dfb1d26656.gif)

* タスクの編集
![b019bf5b168178ea90460256353b66aa](https://user-images.githubusercontent.com/70756110/102968525-5cf4d880-4537-11eb-9a84-255f136e5fa5.gif)

* タスクの削除
![a83c1397d706c7630e8898fca281930d](https://user-images.githubusercontent.com/70756110/102968996-3b482100-4538-11eb-8d1a-4659c80b8594.gif)

* いいね機能（非同期）
![70f7b16a234064a8ac192377e1e4b4ca](https://user-images.githubusercontent.com/70756110/102970999-e5757800-453b-11eb-8b1b-4ee90976a191.gif)

#### タスク検索機能（ログインユーザーのみ）
* ジャンル別検索
![afe70fd2daf4ac56b35a21fae8e074fd](https://user-images.githubusercontent.com/70756110/102971269-6df41880-453c-11eb-95e6-b341428de0f0.gif)

#### タスク管理機能（ログインユーザーのみ）
* 今日のタスク一覧の表示
![3c0e5209c552087848367464912f1c13](https://user-images.githubusercontent.com/70756110/102971626-0be7e300-453d-11eb-89d1-cd6a760d3af4.gif)

* 達成機能（投稿したタスクも変化します。）
![5a6fb3ab799ed90693a9ad2ddbdc9dda](https://user-images.githubusercontent.com/70756110/102971768-50737e80-453d-11eb-92d6-eb7db5e277d1.gif)

#### タスク記録機能（ログインユーザーのみ）
* タスク数・達成数・達成時間計・1週間の達成数（chartkick）の表示
![990f04472e0daee15966d320dc6931c1](https://user-images.githubusercontent.com/70756110/102972156-f6bf8400-453d-11eb-8b6f-657f1b03ee10.gif)

## ER図
[![Image from Gyazo](https://i.gyazo.com/e45f0c33c9a817305ef222b7365ff718.png)](https://gyazo.com/e45f0c33c9a817305ef222b7365ff718)

## 環境・使用技術
#### フロントエンド
* HTML/CSS/jQuery/FontAwesome

#### バックエンド
* Ruby'2.6.5'/Ruby on Rails'6.0.0'

#### テストコード
* Rspec/FactoryBot/Faker

## 今後の実装予定
#### 開発環境
* Docker/Docker-compose

#### 本番環境
* AWS（EC2）
* AWS(EC2,Route53,S3)
* アプリケーションサーバー(Unicorn)
* Webサーバー(Nginx)
* データベース(mariaDB)
* 自動デプロイ(Capistrano3)
* CircleCIの導入

#### 機能
* キーワード検索機能
* ユーザーアイコン機能