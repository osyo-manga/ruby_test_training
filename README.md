# Ruby のテストの問題集

## これはなに

Ruby / RSpec のテストの問題集です。


## 前提となる知識

* Ruby の基本的な構文
* git の使い方


## 対象のバージョン

* Ruby 3.2.2 以上
* RSpec 3.12 以上


## 進め方（RSpec 編）

### 1. リポジトリをクローンする

```shell
$ git clone https://github.com/osyo-manga/ruby_test_training
$ cd ruby_test_training
```

### 2. gem のインストール

```shell
$ bundle install
```

### 3. テストの修正

修正したいテストの `xcontext` を `context` に変えて `___` の部分をテストが通るように置き換える。
元のテストが以下のような場合

```ruby
describe "#length" do
  subject { string.length }

  xcontext "1文字以上の場合" do
    let(:string) { "hoge" }
    it { is_expected.to eq ___ }
  end
end
```

以下のように置き換える

```ruby
describe "#length" do
  subject { string.length }

  # context に治す
  context "1文字以上の場合" do
    let(:string) { "hoge" }
    # ___ を変える
    it { is_expected.to eq 4 }
  end
end
```

### 4. テストを実行する

テストを実行してパスすれば OK

```shell
$ rake spec
```


## 問題を更新する

### 1. 作業用のブランチを切る

```shell
# my_branch という名前で新しいブランチを切る
$ git switch -c my_branch
Switched to a new branch 'my_branch'
# ブランチを確認
$ git branch
  master
* my_branch
```

### 2. 解答したファイルをコミットする

```shell
# 解答したファイルを追加
$ git add spec/question/stdlib/string_spec.rb
ruby_test_training $ git commit -m "解答を追加"
[my_branch eff3716] 解答を追加
 1 file changed, 2 insertions(+), 2 deletions(-)
```

### 3. 最新の問題を取り込む

```shell
$ git pull --rebase origin master
```

