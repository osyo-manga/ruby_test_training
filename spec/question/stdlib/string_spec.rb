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
      let(:char) { ___ }
      it { expect { string.count(char) }.to raise_error ___ }
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

  describe "#include?" do
    subject { string.include?(substr) }

    let(:string) { "hogeほげ" }

    xcontext "`substr` が `'hoge'` の場合" do
      let(:substr) { "hoge" }

      it { is_expected.to eq ___ }
    end

    xcontext "`substr` が `'ほげ'` の場合" do
      let(:substr) { "ほげ" }

      it { is_expected.to eq ___ }
    end

    xcontext "`substr` が `'foo'` の場合" do
      let(:substr) { "foo" }

      it { is_expected.to eq ___ }
    end

    xcontext "`substr` が空文字列の場合" do
      let(:substr) { "" }

      it { is_expected.to eq ___ }
    end

    xcontext "`substr` が nil の場合" do
      let(:substr) { nil }

      it { expect { subject }.to raise_error ___ }
    end
  end

  describe "#+" do
    subject { string + other }

    let(:string) { "hoge" }

    xcontext "`other` が空文字列じゃない場合" do
      let(:other) { ___ }

      it { is_expected.to eq "hogefoo" }
    end

    xcontext "`other` が空文字列の場合" do
      let(:other) { "" }

      it { is_expected.to eq ___ }
    end

    xcontext "`other` が数値の場合" do
      let(:other) { 42 }

      it { expect { subject }.to raise_error ___ }
    end

    xcontext "`other` が nil の場合" do
      let(:other) { ___ }

      it { expect { subject }.to raise_error TypeError }
    end

    xcontext "`other` が Symbol の場合" do
      let(:other) { :foo }

      it { expect { subject }.to raise_error ___ }
    end
  end

  describe "#chomp" do
    subject { string.chomp(*args) }

    let(:args) { [] }

    xcontext "末尾に改行コードがある場合" do
      let(:string) { "hoge\n" }

      it { is_expected.to eq ___ }
    end

    xcontext "先頭と末尾に改行コードが複数ある場合" do
      let(:string) { "\nhoge\n" }

      it { is_expected.to eq ___ }
    end

    xcontext "末尾に改行コードが複数ある場合" do
      let(:string) { ___ }

      it { is_expected.to eq "hoge\n" }
    end

    context "引数がある場合" do
      xcontext "'' を渡された場合" do
        let(:args) { [""] }
        let(:string) { "hoge\n\n\n" }

        it { is_expected.to eq ___ }
      end

      xcontext "nil を渡された場合" do
        let(:args) { [nil] }
        let(:string) { ___ }

        it { is_expected.to eq "hoge\n" }
      end

      xcontext "* を渡された場合" do
        let(:args) { ["*"] }
        let(:string) { ___ }

        it { is_expected.to eq "**hoge*" }
      end
    end
  end

  describe "#next" do
    subject { string.next }

    xcontext "文字の場合" do
      let(:string) { "abc" }

      it { is_expected.to eq ___ }
    end

    xcontext "数値の場合" do
      let(:string) { ___ }

      it { is_expected.to eq "43" }
    end

    xcontext "記号の場合" do
      let(:string) { "*" }

      it { is_expected.to eq ___ }
    end

    xcontext "ZZZZ の場合" do
      let(:string) { ___ }

      it { is_expected.to eq "AAAAA" }
    end

    xcontext "999 の場合" do
      let(:string) { "999" }

      it { is_expected.to eq ___ }
    end

    xcontext "文字と数値が混ざってる場合" do
      let(:string) { "9Z" }

      it { is_expected.to eq ___ }
    end

    xcontext "文字と記号が混ざってる場合" do
      let(:string) { "3.3.0" }

      it { is_expected.to eq ___ }
    end
  end

  describe "#start_with?" do
    subject { string.start_with?(*args) }

    let(:string) { "import-001" }

    xcontext "先頭にマッチする文字列を引数に渡した場合" do
      let(:args) { ["import"] }

      it { is_expected.to eq ___ }
    end

    xcontext "先頭にマッチしない文字列を引数に渡した場合" do
      let(:args) { ["export"] }

      it { is_expected.to eq ___ }
    end

    xcontext "先頭にマッチする正規表現を引数に渡した場合" do
      let(:args) { [/\w+/] }

      it { is_expected.to eq ___ }
    end

    xcontext "先頭にマッチしない正規表現を引数に渡した場合" do
      let(:args) { [/\d+/] }

      it { is_expected.to eq ___ }
    end

    context "引数が複数ある場合" do
      let(:args) { ["import", /\d+/] }

      xcontext "第一引数にマッチする場合" do
        let(:string) { "import-001" }

        it { is_expected.to eq ___ }
      end

      xcontext "第二引数にマッチする場合" do
        let(:string) { "001-import" }

        it { is_expected.to eq ___ }
      end

      xcontext "どの引数にもマッチしない場合" do
        let(:string) { "export-001" }

        it { is_expected.to eq ___ }
      end
    end
  end

  describe "#end_with?" do
    subject { string.end_with?(*args) }

    let(:string) { "sheet.csv" }

    xcontext "末尾にマッチする文字列を引数に渡した場合" do
      let(:args) { [".csv"] }

      it { is_expected.to eq ___ }
    end

    xcontext "末尾にマッチしない文字列を引数に渡した場合" do
      let(:args) { [".xlsx"] }

      it { is_expected.to eq ___ }
    end

    xcontext "末尾にマッチする正規表現を引数に渡した場合" do
      let(:args) { [/\w+/] }

      it { expect { subject }.to raise_error ___ }
    end

    context "引数が複数ある場合" do
      let(:args) { [".csv", ".xlsx"] }

      xcontext "第一引数にマッチする場合" do
        let(:string) { "sheet.csv" }

        it { is_expected.to eq ___ }
      end

      xcontext "第二引数にマッチする場合" do
        let(:string) { "sheet.xlsx" }

        it { is_expected.to eq ___ }
      end

      xcontext "どの引数にもマッチしない場合" do
        let(:string) { "sheet.jpg" }

        it { is_expected.to eq ___ }
      end
    end
  end

  describe "#center" do
    subject { string.center(*args) }

    let(:string) { "foo" }
    let(:args) { [width] }

    xcontext "`width` に `6` を渡した場合" do
      let(:width) { 6 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `5` を渡した場合" do
      let(:width) { 5 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `4` を渡した場合" do
      let(:width) { ___ }
      it { is_expected.to eq "foo " }
    end

    xcontext "`width` に `2` を渡した場合" do
      let(:width) { 2 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `0` を渡した場合" do
      let(:width) { 0 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `-1` を渡した場合" do
      let(:width) { -1 }
      it { is_expected.to eq ___ }
    end

    xcontext "第二引数に `*` を渡した場合" do
      let(:args) { [8, "*"] }
      it { is_expected.to eq ___ }
    end

    xcontext "引数を渡さなかった時" do
      let(:args) { [] }
      it { expect { subject }.to raise_error ___ }
    end

    context "マルチバイト文字に対して呼び出した場合" do
      let(:string) { "ほむ" }

      xcontext "`width` に `4` を渡した場合" do
        let(:width) { 4 }
        it { is_expected.to eq ___ }
      end

      xcontext "`width` に `3` を渡した場合" do
        let(:width) { 3 }
        it { is_expected.to eq ___ }
      end

      xcontext "`width` に `1` を渡した場合" do
        let(:width) { 1 }
        it { is_expected.to eq ___ }
      end
    end
  end

  describe "#ljust" do
    subject { string.ljust(*args) }

    let(:string) { "foo" }
    let(:args) { [width] }

    xcontext "`width` に `6` を渡した場合" do
      let(:width) { 6 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `5` を渡した場合" do
      let(:width) { 5 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `4` を渡した場合" do
      let(:width) { ___ }
      it { is_expected.to eq "foo " }
    end

    xcontext "`width` に `2` を渡した場合" do
      let(:width) { 2 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `0` を渡した場合" do
      let(:width) { 0 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `-1` を渡した場合" do
      let(:width) { -1 }
      it { is_expected.to eq ___ }
    end

    xcontext "第二引数に `*` を渡した場合" do
      let(:args) { [8, "*"] }
      it { is_expected.to eq ___ }
    end

    xcontext "引数を渡さなかった時" do
      let(:args) { [] }
      it { expect { subject }.to raise_error ___ }
    end

    context "マルチバイト文字に対して呼び出した場合" do
      let(:string) { "ほむ" }

      xcontext "`width` に `4` を渡した場合" do
        let(:width) { 4 }
        it { is_expected.to eq ___ }
      end

      xcontext "`width` に `3` を渡した場合" do
        let(:width) { 3 }
        it { is_expected.to eq ___ }
      end

      xcontext "`width` に `1` を渡した場合" do
        let(:width) { 1 }
        it { is_expected.to eq ___ }
      end
    end
  end

  describe "#rjust" do
    subject { string.rjust(*args) }

    let(:string) { "foo" }
    let(:args) { [width] }

    xcontext "`width` に `6` を渡した場合" do
      let(:width) { 6 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `5` を渡した場合" do
      let(:width) { ___ }
      it { is_expected.to eq "  foo" }
    end

    xcontext "`width` に `4` を渡した場合" do
      let(:width) { 4 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `2` を渡した場合" do
      let(:width) { 2 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `0` を渡した場合" do
      let(:width) { 0 }
      it { is_expected.to eq ___ }
    end

    xcontext "`width` に `-1` を渡した場合" do
      let(:width) { -1 }
      it { is_expected.to eq ___ }
    end

    xcontext "第二引数に `*` を渡した場合" do
      let(:args) { [8, "*"] }
      it { is_expected.to eq ___ }
    end

    xcontext "引数を渡さなかった時" do
      let(:args) { [] }
      it { expect { subject }.to raise_error ___ }
    end

    context "マルチバイト文字に対して呼び出した場合" do
      let(:string) { "ほむ" }

      xcontext "`width` に `4` を渡した場合" do
        let(:width) { 4 }
        it { is_expected.to eq ___ }
      end

      xcontext "`width` に `3` を渡した場合" do
        let(:width) { 3 }
        it { is_expected.to eq ___ }
      end

      xcontext "`width` に `1` を渡した場合" do
        let(:width) { 1 }
        it { is_expected.to eq ___ }
      end
    end
  end

  describe "#split" do
    subject { string.split(*args) }

    let(:args) { [] }

    xcontext "引数を渡さなかった場合" do
      let(:string) { "homu mami mado" }

      it { is_expected.to eq ___ }

      xcontext "対象の文字列に前後に空白文字がある場合" do
        let(:string) { "  homu mami mado    " }

        it { is_expected.to eq ___ }
      end

      xcontext "対象の文字列が空の文字列" do
        let(:string) { "" }

        it { is_expected.to eq ___ }
      end
    end

    context "第一引数を渡した場合" do
      xcontext "`,` を渡した場合" do
        let(:string) { "homu,mami,mado" }
        let(:args) { [","] }

        it { is_expected.to eq ___ }
      end

      xcontext "`+` を渡した場合" do
        let(:string) { ___ }
        let(:args) { ["+"] }

        it { is_expected.to eq ["homu", "mami", "mado"] }
      end

      xcontext "nil を渡した場合" do
        let(:string) { "homu mami mado" }
        let(:args) { [nil] }

        it { is_expected.to eq ___ }
      end

      xcontext "`＿` を渡した場合" do
        let(:string) { ___ }
        let(:args) { ["＿"] }

        it { is_expected.to eq ["ああ", "いい", "うう"] }
      end

      xcontext "正規表現を渡した場合" do
        let(:string) { "homu    mami      mado" }
        let(:args) { [/\s+/] }

        it { is_expected.to eq ___ }
      end

      xcontext "空文字列を渡した場合" do
        let(:string) { "homu" }
        let(:args) { [""] }

        it { is_expected.to eq ___ }
      end

      xcontext "空の正規表現を渡した場合" do
        let(:string) { "homu" }
        let(:args) { [//] }

        it { is_expected.to eq ___ }
      end
    end

    context "第二引数を渡した場合" do
      let(:string) { "homu mami mado saya an" }

      xcontext "0 を渡した場合" do
        let(:args) { [" ", 0] }

        it { is_expected.to eq ___ }
      end

      xcontext "1 を渡した場合" do
        let(:args) { [" ", 1] }

        it { is_expected.to eq ___ }
      end

      xcontext "3 を渡した場合" do
        let(:args) { [" ", 3] }

        it { is_expected.to eq ___ }
      end

      xcontext "5 を渡した場合" do
        let(:args) { [" ", 5] }

        it { is_expected.to eq ___ }
      end

      xcontext "-1 を渡した場合" do
        let(:args) { [" ", -1] }

        it { is_expected.to eq ___ }
      end
    end
  end

  describe "#<<" do
    subject { string << obj }

    let(:string) { "homu" }

    xcontext "`a` を渡した場合" do
      let(:obj) { "a" }   # string << "a" と同等

      it { is_expected.to eq ___ }
      # string << obj した結果、string の値がどう変わるかを検証するテスト
      # from に変更前の値を渡し、to に変更後の値を渡す
      it { expect { subject }.to change { string }.from("homu").to ___ }
    end

    xcontext "`homu` を渡した場合" do
      let(:obj) { "homu" }   # string << "homu" と同等

      it { is_expected.to eq ___ }
      it { expect { subject }.to change { string }.from("homu").to ___ }
    end

    xcontext "nil を渡した場合" do
      let(:obj) { nil }

      it { expect { subject }.to raise_error ___ }
    end
  end

  describe "#concat" do
    subject { string.concat(*args) }

    let(:string) { "homu" }

    xcontext "引数が1つの場合" do
      let(:args) { ["homu"] }   # string.concat("homu") と同等

      it { is_expected.to eq ___ }
      # string << obj した結果、string の値がどう変わるかを検証するテスト
      # from に変更前の値を渡し、to に変更後の値を渡す
      it { expect { subject }.to change { string }.from("homu").to ___ }
    end

    xcontext "引数が複数の場合" do
      let(:args) { [___, ___] }   # string.concat("mami", "mado") と同等

      it { is_expected.to eq ___ }
      it { expect { subject }.to change { string }.from(___).to "homumamimado" }
    end

    xcontext "引数がない場合" do
      let(:args) { [] }   # string.concat() と同等

      it { is_expected.to eq ___ }
    end
  end
end
