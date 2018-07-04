# CoderDojo 岡山 岡南 公式ホームページ [(テスト公開中)](https://coderdojo-konan-jp-rails.herokuapp.com/)

[![Build Status](https://travis-ci.org/CoderDojo-Konan-Okayama/coderdojo-konan.jp.svg?branch=master)](https://travis-ci.org/CoderDojo-Konan-Okayama/coderdojo-konan.jp)
[![Maintainability](https://api.codeclimate.com/v1/badges/5dc68bf422fb19f6c628/maintainability)](https://codeclimate.com/github/CoderDojo-Konan-Okayama/coderdojo-konan.jp/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5dc68bf422fb19f6c628/test_coverage)](https://codeclimate.com/github/CoderDojo-Konan-Okayama/coderdojo-konan.jp/test_coverage)

移行まではかなーりの時間がかかると思われますが、

WP よりも Rails の方が管理しやすいので（色々と機能の組み込み）段々と進めていきます。

Issue を使用したいため早めにリポジトリを公開しました。（することの管理が紐づいててわかりやすい。）

なお、ソースコードや仕組みや中の文などは coderdojo.jp (https://github.com/coderdojo-japan/coderdojo.jp) を参考にさせていただいております。

また、実際のサイトは、 https://coderdojo-konan-jp-rails.herokuapp.com/ からご覧になれます。（テスト公開中）


## 各機能・仕様

Contributor を大々的？に募っておきながら仕様とかもなにも書かないというのはいけないので、

これから先の予定も含めて思い出せる範囲で書いておきます。

### 全体的な仕様

- ~~デザインは、表側が MDL（マテリアルデザイン・ライト）、ダッシュボードが、AdminLTE を使用。~~ 現在 future/update-desgin-to-own--front ブランチにて、 Bootstrap4 を使用して独自デザインを使おうとしてます。フロントだけでなく、バックもそうする予定。
- Ruby on Rails + RSpec
- 公開環境はいまのところ Heroku
- Heroku のためProduction環境のデータベースは PostgreSQL
- Develop 環境のデータベースは SQLite

### Pages Model, 簡易Page機能（仮）

CoderDojo Japan さんの Docs を参考にさせて頂いた上での実装なので、機能はほぼ同じです。

coderdojo-japan/coderdojo.jp

db/pages 配下のMDファイルをそのまま変換し、比較的軽いページの生成をします。

WP で言う所の **固定ページ** 的感覚です。

### StaticPages, 静的ページ

HAML直書き... そのまま表示です。（ヘッダー・フッターのぞく。）

デザインが変則的な場合に使います。（例： Topページ、作品紹介ページなど）

WP で言う所の **固定ページ** 的感覚で、なおかつ複雑なデザインがいい場合に使う。

### Posts Model, ブログ記事

ダッシュボードからの操作で投稿・削除・予約公開などを行います。

MDを使いますが、今後 TinyMCE みたいなのを導入するかもしれません。

- 投稿
- 削除
- 予約投稿
- スラッグ設定
- 限定公開（予定）

まだまだ一部を作っていってる途中で、後々もうちょっと追加したいと思っている機能もあります。

WP で言う所の **投稿**　ですね、ストレート。

## Want to...

- SpeakerDeck においてあるチュートリアルの組み込み・課題などはリンクさせてスコアとか出したかったりする。
