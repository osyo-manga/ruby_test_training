require "rspec"

RSpec.describe String do
  describe "#length" do
    subject { string.length }

    context "`string` が1文字以上の場合" do
      let(:string) { "hoge" }
      it { is_expected.to eq 4 }
    end

    context "`string` が0文字の場合" do
      let(:string) { "" }
      it { is_expected.to eq 0 }
    end

    context "マルチバイト文字が混ざっている場合" do
      let(:string) { "あいうえお" }
      it { is_expected.to eq 5 }
    end
  end

  describe "#upcase" do
    subject { string.upcase }

    context "全て小文字の場合" do
      let(:string) { "hoge" }
      it { is_expected.to eq "HOGE" }
    end

    context "全て大文字の場合" do
      let(:string) { "HOGE" }
      it { is_expected.to eq "HOGE" }
    end

    context "大文字と小文字が混ざっている場合" do
      let(:string) { "HoGe" }
      it { is_expected.to eq "HOGE" }
    end

    context "ギリシャ文字が混ざっている場合" do
      let(:string) { "αβγ" }
      it { is_expected.to eq "ΑΒΓ" }
    end

    context "記号が混ざっている場合" do
      let(:string) { "090-1111-2222" }
      it { is_expected.to eq "090-1111-2222" }
    end
  end

  describe "#downcase" do
    subject { string.downcase }

    context "全て小文字の場合" do
      let(:string) { "hoge" }
      it { is_expected.to eq "hoge" }
    end

    context "全て大文字の場合" do
      let(:string) { "HOGE" }
      it { is_expected.to eq "hoge" }
    end

    context "ギリシャ文字が混ざっている場合" do
      let(:string) { "ΑΒΓ" }
      it { is_expected.to eq "αβγ" }
    end

    context "記号が混ざっている場合" do
      let(:string) { "090-1111-2222" }
      it { is_expected.to eq "090-1111-2222" }
    end
  end

  describe "#swapcase" do
    subject { string.swapcase }

    context "全て小文字の場合" do
      let(:string) { "hoge" }
      it { is_expected.to eq "HOGE" }
    end

    context "全て大文字の場合" do
      let(:string) { "HOGE" }
      it { is_expected.to eq "hoge" }
    end

    context "大文字と小文字が混ざっている場合" do
      let(:string) { "HoGe" }
      it { is_expected.to eq "hOgE" }
    end
  end

  describe "#capitalize" do
    subject { string.capitalize }

    context "全て小文字の場合" do
      let(:string) { "hoge" }
      it { is_expected.to eq "Hoge" }
    end

    context "全て大文字の場合" do
      let(:string) { "HOGE" }
      it { is_expected.to eq "Hoge" }
    end

    context "先頭以外が大文字の場合" do
      let(:string) { "hOGE" }
      it { is_expected.to eq "Hoge" }
    end

    context "先頭が記号の場合" do
      let(:string) { "+hoge" }
      it { is_expected.to eq "+hoge" }
    end

    context "日本語が混ざってる場合" do
      let(:string) { "あいうえお" }
      it { is_expected.to eq "あいうえお" }
    end
  end

  describe "#count" do
    subject { string.count(char) }

    context "`string` に `char` の値が含まれている場合" do
      let(:string) { "hogehoge" }
      let(:char) { "h" }
      it { is_expected.to eq 2 }
    end

    context "`string` に `char` の値が含まれていない場合" do
      let(:string) { "hogehoge" }
      let(:char) { "a" }
      it { is_expected.to eq 0 }
    end

    context "`char` の値が nil の場合" do
      let(:string) { "hogehoge" }
      let(:char) { nil }
      it { expect { subject }.to raise_error TypeError }
    end
  end

  describe "#reverse" do
    subject { string.reverse }

    context "1文字以上の場合" do
      let(:string) { "hogehoge" }
      it { is_expected.to eq "egohegoh" }
    end

    context "0文字以上の場合" do
      let(:string) { "" }
      it { is_expected.to eq "" }
    end

    context "マルチバイト文字が混ざっている場合" do
      let(:string) { "あいうえお" }
      it { is_expected.to eq "おえういあ" }
    end
  end

  describe "#chars" do
    subject { string.chars }

    context "`string` が1文字以上の場合" do
      let(:string) { "hello世界" }
      it { is_expected.to eq ["h", "e", "l", "l", "o", "世", "界"] }
    end

    context "`string` が0文字の場合" do
      let(:string) { "" }
      it { is_expected.to eq [] }
    end
  end

  describe "#chop" do
    subject { string.chop }

    context "`string` が1文字以上の場合" do
      let(:string) { "ほむほむ" }
      it { is_expected.to eq "ほむほ" }
    end

    context "`string` が0文字の場合" do
      let(:string) { "" }
      it { is_expected.to eq "" }
    end
  end

  describe "#insert" do
    subject { string.insert(pos, other) }

    context "-3番目に `mami` を挿入した場合" do
      let(:string) { "homu" }
      let(:pos) { -3 }
      let(:other) { "mado" }

      it { is_expected.to eq "homadomu" }
    end

    context "0番目に `mami` を挿入した場合" do
      let(:string) { "homu" }
      let(:pos) { 0 }
      let(:other) { "mami" }

      it { is_expected.to eq "mamihomu" }
    end

    context "3番目に `mami` を挿入した場合" do
      let(:string) { "homu" }
      let(:pos) { 3 }
      let(:other) { "saya" }

      it { is_expected.to eq "homsayau" }
    end

    context "10番目に `mami` を挿入した場合" do
      let(:string) { "homu" }
      let(:pos) { 10 }
      let(:other) { "mami" }

      it { expect { subject }.to raise_error IndexError }
    end
  end

  describe "#delete" do
    subject { string.delete(*strs) }

    context "引数が1つだけの場合" do
      let(:string) { "1234hoge5678" }
      let(:strs) { [str] }

      context "`str` に `hoge` を渡した場合" do
        let(:str) { "hoge" }

        it { is_expected.to eq "12345678" }
      end

      context "`str` に `2-5` を渡した場合" do
        let(:str) { "2-5" }

        it { is_expected.to eq "1hoge678" }
      end
    end

    context "引数が2つの場合" do
      let(:string) { "1234hoge5678" }
      let(:strs) { [str1, str2] }

      context "`str` に `2-8` `str2` に `^5-6` を渡した場合" do
        let(:str1) { "2-8" }
        let(:str2) { "^5-6" }

        it { is_expected.to eq "1hoge56" }
      end
    end
  end

  describe "#include?" do
    subject { string.include?(substr) }

    let(:string) { "hogeほげ" }

    context "`substr` が `'hoge'` の場合" do
      let(:substr) { "hoge" }

      it { is_expected.to eq true }
    end

    context "`substr` が `'ほげ'` の場合" do
      let(:substr) { "ほげ" }

      it { is_expected.to eq true }
    end

    context "`substr` が `'foo'` の場合" do
      let(:substr) { "foo" }

      it { is_expected.to eq false }
    end

    context "`substr` が空文字列の場合" do
      let(:substr) { "" }

      it { is_expected.to eq true }
    end

    context "`substr` が nil の場合" do
      let(:substr) { nil }

      it { expect { subject }.to raise_error TypeError }
    end
  end

  describe "#+" do
    subject { string + other }

    let(:string) { "hoge" }

    context "`other` が `'foo'` の場合" do
      let(:other) { "foo" }

      it { is_expected.to eq "hogefoo" }
    end

    context "`other` が空文字列の場合" do
      let(:other) { "" }

      it { is_expected.to eq "hoge" }
    end

    context "`other` が数値の場合" do
      let(:other) { 42 }

      it { expect { subject }.to raise_error TypeError }
    end

    context "`other` が nil の場合" do
      let(:other) { nil }

      it { expect { subject }.to raise_error TypeError }
    end

    context "`other` が Symbol の場合" do
      let(:other) { :foo }

      it { expect { subject }.to raise_error TypeError }
    end
  end

  describe "#chomp" do
    subject { string.chomp(*args) }

    let(:args) { [] }

    context "末尾に改行コードがある場合" do
      let(:string) { "hoge\n" }

      it { is_expected.to eq "hoge" }
    end

    context "先頭と末尾に改行コードが複数ある場合" do
      let(:string) { "\nhoge\n" }

      it { is_expected.to eq "\nhoge" }
    end

    context "末尾に改行コードが複数ある場合" do
      let(:string) { "hoge\n\n" }

      it { is_expected.to eq "hoge\n" }
    end

    context "引数がある場合" do
      context "'' を渡された場合" do
        let(:args) { [""] }
        let(:string) { "hoge\n\n\n" }

        it { is_expected.to eq "hoge" }
      end

      context "nil を渡された場合" do
        let(:args) { [nil] }
        let(:string) { "hoge\n" }

        it { is_expected.to eq "hoge\n" }
      end

      context "* を渡された場合" do
        let(:args) { ["*"] }
        let(:string) { "**hoge**" }

        it { is_expected.to eq "**hoge*" }
      end
    end
  end

  describe "#next" do
    subject { string.next }

    context "文字の場合" do
      let(:string) { "abc" }

      it { is_expected.to eq "abd" }
    end

    context "数値の場合" do
      let(:string) { "42" }

      it { is_expected.to eq "43" }
    end

    context "記号の場合" do
      let(:string) { "*" }

      it { is_expected.to eq "+" }
    end

    context "ZZZZ の場合" do
      let(:string) { "ZZZZ" }

      it { is_expected.to eq "AAAAA" }
    end

    context "999 の場合" do
      let(:string) { "999" }

      it { is_expected.to eq "1000" }
    end

    context "文字と数値が混ざってる場合" do
      let(:string) { "9Z" }

      it { is_expected.to eq "10A" }
    end

    context "文字と記号が混ざってる場合" do
      let(:string) { "3.3.0" }

      it { is_expected.to eq "3.3.1" }
    end
  end
end
