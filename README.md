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

## 4. テストを実行する

テストを実行してパスすれば OK

```shell
$ rake spec
```


