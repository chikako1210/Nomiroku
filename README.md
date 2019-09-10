# Nomiroku
DMM WEBCAMPのポートフォリオ制作課題です。  
「のみ録」という日本酒のレビューサイトです。

### Feature
- ログインせずにレビューの検索閲覧ができます。
- アカウント登録することでレビューの投稿とレビューのお気に入り機能が使えます。
- 「のみ図」により自分が今までどこの日本酒をどれだけ飲んだか、視覚的にわかるようになります。
- 管理者機能ではユーザーとレビューの管理ができます。

### Requirement
Ruby 2.5.5  
Ruby on Rails 5.2.3  
HTML/CSS  
JavaScript  
JQuery  
Node.js

### Usage
開発環境で動作確認する場合、
`git clone git@github.com:chikako1210/Nomiroku.git`  
`cd Nomiroku`  
`bundle install`  
アカウント登録時にメール認証(deviseによる)を設定しているので、開発環境によってactionmailerのURLを適宜変更してください。メールの確認は、開発環境URL/letter_opener で出来ます。


### Authors
鹿島　千花子
