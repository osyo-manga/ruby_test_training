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
end
