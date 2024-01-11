require "rspec"

RSpec.describe String do
  describe "#length" do
    subject { string.length }

    xcontext "1文字以上の場合" do
      let(:string) { "hoge" }
      it { is_expected.to eq ___ }
    end

    xcontext "0文字の場合" do
      let(:string) { ___ }
      it { is_expected.to eq 0 }
    end

    xcontext "マルチバイト文字が混ざっている場合" do
      let(:string) { "あいうえお" }
      it { is_expected.to eq ___ }
    end
  end

  describe "#upcase" do
    subject { string.upcase }

    xcontext "全て小文字の場合" do
      let(:string) { ___ }
      it { is_expected.to eq "HOGE" }
    end

    xcontext "全て大文字の場合" do
      let(:string) { "HOGE" }
      it { is_expected.to eq ___ }
    end

    xcontext "大文字と小文字が混ざっている場合" do
      let(:string) { "HoGe" }
      it { is_expected.to eq ___ }
    end

    xcontext "ギリシャ文字が混ざっている場合" do
      let(:string) { "αβγ" }
      it { is_expected.to eq ___ }
    end

    xcontext "記号が混ざっている場合" do
      let(:string) { "090-1111-2222" }
      it { is_expected.to eq ___ }
    end
  end

  describe "#downcase" do
    subject { string.downcase }

    xcontext "全て小文字の場合" do
      let(:string) { "hoge" }
      it { is_expected.to eq ___ }
    end

    xcontext "全て大文字の場合" do
      let(:string) { ___ }
      it { is_expected.to eq "hoge" }
    end

    xcontext "大文字と小文字が混ざっている場合" do
      let(:string) { "HoGe" }
      it { is_expected.to eq ___ }
    end

    xcontext "ギリシャ文字が混ざっている場合" do
      let(:string) { "ΑΒΓ" }
      it { is_expected.to eq ___ }
    end
  end

  describe "#swapcase" do
    subject { string.swapcase }

    xcontext "全て小文字の場合" do
      let(:string) { "hoge" }
      it { is_expected.to eq ___ }
    end

    xcontext "全て大文字の場合" do
      let(:string) { "HOGE" }
      it { is_expected.to eq ___ }
    end

    xcontext "大文字と小文字が混ざっている場合" do
      let(:string) { ___ }
      it { is_expected.to eq "hOgE" }
    end
  end

  describe "#capitalize" do
    subject { string.capitalize }

    xcontext "全て小文字の場合" do
      let(:string) { "hoge" }
      it { is_expected.to eq ___ }
    end

    xcontext "全て大文字の場合" do
      let(:string) { ___ }
      it { is_expected.to eq "Hoge" }
    end

    xcontext "先頭以外が大文字の場合" do
      let(:string) { "hOGE" }
      it { is_expected.to eq ___ }
    end

    xcontext "先頭が記号の場合" do
      let(:string) { "+hoge" }
      it { is_expected.to eq ___ }
    end

    xcontext "日本語が混ざってる場合" do
      let(:string) { "あいうえお" }
      it { is_expected.to eq ___ }
    end
  end

  describe "#count" do
    subject { string.count(char) }

    xcontext "`string` に `char` の値が含まれている場合" do
      let(:string) { "hogehoge" }
      let(:char) { "h" }
      it { is_expected.to eq ___ }
    end

    xcontext "`string` に `char` の値が含まれていない場合" do
      let(:string) { "hogehoge" }
      let(:char) { "a" }
      it { is_expected.to eq ___ }
    end

    xcontext "`char` の値が nil の場合" do
      let(:string) { "hogehoge" }
      let(:char) { nil }
      it { expect { string.count(char) }.to raise_error TypeError }
    end
  end

  describe "#reverse" do
    subject { ___ }

    xcontext "1文字以上の場合" do
      let(:string) { "hogehoge" }
      it { is_expected.to eq ___ }
    end

    xcontext "0文字以上の場合" do
      let(:string) { "" }
      it { is_expected.to eq ___ }
    end

    xcontext "マルチバイト文字が混ざっている場合" do
      let(:string) { "あいうえお" }
      it { is_expected.to eq ___ }
    end
  end

  describe "#chars" do
    subject { string.chars }

    xcontext "`string` が1文字以上の場合" do
      let(:string) { "hello世界" }
      it { is_expected.to eq ["h", "e", ___, "l", ___, ___, "界"] }
    end

    xcontext "`string` が0文字の場合" do
      let(:string) { "" }
      it { is_expected.to eq [___] }
    end
  end

  describe "#chop" do
    subject { string.chop }

    xcontext "`string` が1文字以上の場合" do
      let(:string) { "ほむほむ" }
      it { is_expected.to eq ___ }
    end

    xcontext "`string` が0文字の場合" do
      let(:string) { "" }
      it { is_expected.to eq ___ }
    end
  end

  describe "#insert" do
    subject { string.insert(pos, other) }

    xcontext "-3番目に `mami` を挿入した場合" do
      let(:string) { "homu" }
      let(:pos) { -3 }
      let(:other) { "mado" }

      it { is_expected.to eq ___ }
    end

    xcontext "0番目に `mami` を挿入した場合" do
      let(:string) { "homu" }
      let(:pos) { 0 }
      let(:other) { ___ }

      it { is_expected.to eq "mamihomu" }
    end

    xcontext "3番目に `mami` を挿入した場合" do
      let(:string) { "homu" }
      let(:pos) { 3 }
      let(:other) { "saya" }

      it { is_expected.to eq ___ }
    end

    xcontext "10番目に `mami` を挿入した場合" do
      let(:string) { "homu" }
      let(:pos) { 10 }
      let(:other) { "mami" }

      it { expect { subject }.to raise_error ___ }
    end
  end

  describe "#delete" do
    subject { string.delete(*strs) }

    context "引数が1つだけの場合" do
      let(:string) { "1234hoge5678" }
      let(:strs) { [str] }

      xcontext "`str` に `hoge` を渡した場合" do
        let(:str) { "hoge" }

        it { is_expected.to eq ___ }
      end

      xcontext "`str` に `2-5` を渡した場合" do
        let(:str) { "2-5" }

        it { is_expected.to eq ___ }
      end
    end

    context "引数が2つの場合" do
      let(:string) { "1234hoge5678" }
      let(:strs) { [str1, str2] }

      xcontext "`str` に `2-8` `str2` に `^5-6` を渡した場合" do
        let(:str1) { ___ }
        let(:str2) { "^5-6" }

        it { is_expected.to eq ___ }
      end
    end
  end
end
