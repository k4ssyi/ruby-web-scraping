## プログラミング提出課題

### 以下の要件を満たすプログラミング実装を行って下さい。

#### 実装内容
* www.gooya.co.jp/news から記事一覧のjson ファイル作成
https://www.gooya.co.jp/news のHTML解析をおこない、記事一覧のテキスト
内容をjsonファイルへ変換するアプリケーションを作成してください。json
ファイルのフォーマット例は以下の通りとします。


* [{"date":"2018­05­01","label":"ico­cooperation","url":"https://www.gooya.co.jp/c
ooperation/501/","description":"テレビ〇〇系ドラマ「〇〇」にGOOYAのオフィス提供
を行いました。同時に、社長室の〇〇が出演いたしました。
"},{"label":"ico­ir","url":"https://www.gooya.co.jp/ir/495/","date":"2018­03­28","
description":"増資のお知らせ"},{....}]


* 言語
  * PHP、Ruby、Python、Perl の中から選択してください。


* その他
  * 実装内容の説明や実行方法を記載した README.txt  を合わせて作成してください。
  * 一般的に公開されているライブラリの利用は可能なものとします。
  * WEB上に存在するソースコード等、提出者以外が作成したソースコードのコピーをおこなう際は必ずその旨を記載してください。

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

### 本実装の仕様

パッケージ管理：Bundler

言語 : Ruby 2.5.1

使用gem : nokogiri

実行方法

1. web-scraping のディレクトリに入る

```
cd /web-scraping
```

※ Nokogiriをインストールしていない場合先にインストールしておく

```
gem install nokogiri
```
2. Gemfileにnokogiriを追加し、bundle install を実行

```ruby
gem 'nokogiri'
```

```
bundle install
```


3. scraping.rbファイルを実行する

```web-scraping
ruby scraping.rb
```


参考URL
> [Nokogiriを使ったRubyスクレイピング [初心者向けチュートリアル]](https://morizyun.github.io/blog/ruby-nokogiri-scraping-tutorial/#7)

> [Ruby:nokogiriを使ったWebスクレイピングの基礎・入門 - 窓際BLOG](http://madogiwa0124.hatenablog.com/entry/2017/09/01/000227)

#### 開発の進め方、参考資料を使った理由
1. HTML解析の経験がなかったので、Webで概要を調べる
2. RubyでWebスクレイピングする方法について調べnokogiriを使うことがわかった
3. 参考URLを元に、スクレイピング先のURLのタイトルを出力してみる
4. 課題用に変数名や値を変更して出力してみる
5. XpathとCSSセレクタを使って記事一覧だけ取り出したい、Xpath技法について調べる
6. 記事一覧を取り出せたのでJson形式でファイルを保存するやり方がないか調べる
