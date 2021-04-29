# README

**【アプリケーション名】**
Dear Femi

**【アプリケーション概要】**
日常生活で感じた違和感やもやもやをフェミニズム、ジェンダー論を通して話し合い、個人のより良い人生を目指すためのコミュニケーションWEBサービスです。

**【URL】**

**【テスト用アカウント】**

**【利用方法】**
ユーザー登録は招待制
登録・ログイン後、投稿ができる

**【目指した課題解決】**
フェミニスト、フェミニズムやジェンダーに関心がある人同士が、安心してコミュニケーションをとれる場所が欲しい。

**【洗い出した要件】**
ユーザー管理機能
- ユーザーは招待制で新しく登録できる
- ユーザー登録が完了している場合、ログインすることができる
- ユーザー登録後にユーザー情報を編集することができる
- ログアウトできる

トピック作成機能
- 話したいトピックを作成できる
- ユーザーがタイトル名を決定できる

写真付き投稿機能
- テキストと画像が投稿できる
- 投稿した画像とテキストは投稿したトピックにのみ表示できる

**【実装した機能についての画像やGIF及びその説明】**

**【実装予定の機能】**
タグ一覧機能

**【データベース設計】**
ER図に記載

**【ローカルでの動作方法】**
rails _6.0.0_

# テーブル設計

## users テーブル
| Column             | Type   | Options                   |
|:------------------:|:------:|:-------------------------:|
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many  :topics
- has_many  :comments


## topics テーブル
| Column | Type       | Options            |
|:------:|:----------:|:------------------:|
| image  | string     | ActiveStorageで実装 |
| user   | references | null: false        |
| title  | string     | null: false        |
| text   | text       | null: false        |

### Association

- belongs_to :user
- has_many   :comments


## comments テーブル
| Column  | Type       | Options            |
|:-------:|:----------:|:------------------:|
| image   | string     | ActiveStorageで実装 |
| user    | references | null: false        |
| topic   | references | null: false        |
| comment | text       | null: false        |

### Association

- belongs_to :user
- belongs_to :topic

## tags テーブル
| Column  | Type   | Options                   |
|:-------:|:------:|:-------------------------:|
| tagname | string | null: false, unique: true |

- has_many  :topics
- has_many  :topic_tag_relations


## topictagrelations テーブル
| Column | Type       | Options     |
|:------:|:----------:|:-----------:|
| topic  | references | null: false |
| tag    | references | null: false |

- belongs_to :topic
- belongs_to :tag