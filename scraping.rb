# URLにアクセスするためのライブラリの読み込み
require 'open-uri'

# 外部ライブラリの読み込み
require 'nokogiri'
require 'json'
require 'date'

# 不要な改行、スペースを削除するメソッド
def text_format(str)
    str.strip.gsub(/(\t|\r\n|\r|\n|\f)/,"")
end

# スクレイピング先のURL
url = 'https://www.gooya.co.jp/news'

def get_html(url)
  charset = nil
  html = open(url) do |f|
    charset = f.charset # 文字種別を取得
    f.read # htmlを読み込んで変数htmlに渡す
  end
  # htmlをパース(解析)してオブジェクトを生成
  Nokogiri::HTML.parse(html, nil, charset)
end

# 結果格納用
result = []

# 大元のHTMLをParseした状態で取得
doc = get_html(url.to_s)

date = ""
label = ""
url = ""
description = ""

list = doc.xpath("//section[@class='news-list__wrap']//dl")
list.each do |item|
  date = item.css("dt").inner_text.split(".").join("-")
  label = item.attribute('class').value
  url = item.css("a").attribute('href').value
  description = item.css("dd").inner_text

  result << { date: date, label: label, url: url, description: description }
end

# 結果をJSON形式でファイル保存
file_name = Date.today.strftime("%Y%m%d") + Time.now.strftime("%H%M%S") + "_result.json"
file = File.open(file_name, "w")
file.puts(JSON.generate(result))
