require "rspec"

# docs: https://docs.ruby-lang.org/ja/latest/class/Array.html
RSpec.describe Array do
  describe "#size" do
    subject { array.size }

    let(:array) { [1, 2, "homu", :mami] }

    xit { is_expected.to eq ___ }

    xcontext "nil が混ざってる場合" do
      let(:array) { [nil, 2, nil, 4] }

      it { is_expected.to eq ___ }
    end

    xcontext "空の配列の場合" do
      let(:array) { [] }

      it { is_expected.to eq ___ }
    end
  end

  describe "#at" do
    subject { array.at(nth) }

    let(:array) { ["homu", "mami", "mado"] }

    xcontext "`0` を渡した場合" do
      let(:nth) { 0 }

      it { is_expected.to eq ___ }
    end

    xcontext "`1` を渡した場合" do
      let(:nth) { 1 }

      it { is_expected.to eq ___ }
    end

    xcontext "`5` を渡した場合" do
      let(:nth) { 5 }

      it { is_expected.to eq ___ }
    end

    xcontext "`-1` を渡した場合" do
      let(:nth) { -1 }

      it { is_expected.to eq ___ }
    end

    xcontext "`-2` を渡した場合" do
      let(:nth) { -2 }

      it { is_expected.to eq ___ }
    end

    xcontext "`-5` を渡した場合" do
      let(:nth) { -5 }

      it { is_expected.to eq ___ }
    end

    xcontext "引数に数値以外の価を渡した場合" do
      let(:nth) { "0" }

      it { expect { subject }.to raise_error ___ }
    end
  end

  describe "#[]" do
    subject { array[*args] }

    let(:array) { ["homu", "mami", "mado", "saya", "an"] }

    context "引数に数値を渡した場合" do
      let(:args) { [nth] }   # array[nth] と同等

      xcontext "`0` を渡した場合" do
        let(:nth) { 0 }

        it { is_expected.to eq ___ }
      end

      xcontext "要素数内の数値を渡した場合" do
        let(:nth) { ___ }

        it { is_expected.to eq "mami" }
      end

      xcontext "要素数よりも多い数値を渡した場合" do
        let(:nth) { 5 }

        it { is_expected.to eq ___ }
      end

      xcontext "`-1` を渡した場合" do
        let(:nth) { -1 }

        it { is_expected.to eq ___ }
      end

      xcontext "`-2` を渡した場合" do
        let(:nth) { -2 }

        it { is_expected.to eq ___ }
      end

      xcontext "`-5` を渡した場合" do
        let(:nth) { -5 }

        it { is_expected.to eq ___ }
      end

      xcontext "`-7` を渡した場合" do
        let(:nth) { -7 }

        it { is_expected.to eq ___ }
      end
    end

    context "引数に Range を渡した場合" do
      let(:args) { [range] }   # array[range] と同等

      xcontext "1〜3 の範囲(3 を含む) を渡した場合" do
        let(:range) { 1..3 }

        it { is_expected.to eq ___ }
      end

      xcontext "1〜3 の範囲(3 を含まない) を渡した場合" do
        let(:range) { 1...3 }

        it { is_expected.to eq ___ }
      end

      xcontext "先頭がマイナスの値の範囲を渡した場合" do
        let(:range) { -3..4 }

        it { is_expected.to eq ___ }
      end

      xcontext "終端がマイナスの値の範囲を渡した場合" do
        let(:range) { -4..-2 }

        it { is_expected.to eq ___ }
      end

      xcontext "始点 > 終点になるような範囲を渡した場合" do
        let(:range) { 3..1 }

        it { is_expected.to eq ___ }
      end

      xcontext "終端が範囲外になるような範囲を渡した場合" do
        let(:range) { 2..14 }

        it { is_expected.to eq ___ }
      end

      xcontext "先端と終端が範囲外になるような範囲を渡した場合" do
        let(:range) { 10..14 }

        it { is_expected.to eq ___ }
      end
    end

    context "引数が2つの場合" do
      let(:args) { [start, length] }   # array[start, length] と同等

      xcontext "start に正の数値を渡した場合" do
        let(:start) { 1 }
        let(:length) { 3 }

        it { is_expected.to eq ___ }
      end

      xcontext "start に負の数値を渡した場合" do
        let(:start) { -3 }
        let(:length) { ___ }

        it { is_expected.to eq ["mado", "saya"] }
      end

      xcontext "length に要素数を越える値を渡した場合" do
        let(:start) { ___ }
        let(:length) { 6 }

        it { is_expected.to eq ["mado", "saya", "an"] }
      end

      xcontext "length に負の数値を渡した場合" do
        let(:start) { 2 }
        let(:length) { -2 }

        it { is_expected.to eq ___ }
      end
    end
  end

  describe "#<<" do
    subject { array << obj }

    let(:array) { [1, 2] }

    xcontext "`3` を渡した場合" do
      let(:obj) { 3 }   # array << 3 と同等

      it { is_expected.to eq ___ }
      # array << obj した結果、array の値がどう変わるかを検証するテスト
      # from に変更前の値を渡し、to に変更後の値を渡す
      it { expect { subject }.to change { array }.from([1, 2]).to ___ }
    end

    xcontext "配列を渡した場合" do
      let(:obj) { [3, 4] }   # array << [3, 4] と同等

      it { is_expected.to eq [1, 2, ___] }
      it { expect { subject }.to change { array }.from([1, 2]).to [1, 2, ___] }
    end

    xcontext "nil を渡した場合" do
      let(:obj) { nil }   # array << 3 と同等

      it { is_expected.to eq ___ }
      it { expect { subject }.to change { array }.from([1, 2]).to ___ }
    end
  end

  describe "#push / append" do
    subject { array.push(*args) }
    let(:array) { [1, 2] }

    context "引数に1つの値を渡した場合" do
      xcontext "配列じゃない値を渡した場合" do
        let(:args) { [3] }   # array.push(3) と同等

        it { is_expected.to eq ___ }
        # array.push(*args) した結果、array の値がどう変わるかを検証するテスト
        # from に変更前の値を渡し、to に変更後の値を渡す
        it { expect { subject }.to change { array }.from([1, 2]).to ___ }
      end

      xcontext "配列である値を渡した場合" do
        let(:args) { [[3, 4]] }   # array.push([3, 4]) と同等

        it { is_expected.to eq [1, 2, ___] }
        it { expect { subject }.to change { array }.from([1, 2]).to [1, 2, ___] }
      end
    end

    xcontext "引数に複数の値を渡した場合" do
      let(:args) { ___ }   # array.push(3, 4, 5) と同等

      it { is_expected.to eq [1, 2, 3, 4, 5] }
      it { expect { subject }.to change { array }.from(___).to [1, 2, 3, 4, 5] }
    end

    xcontext "引数に値を渡さなかった場合" do
      let(:args) { [] }   # array.push() と同等

      it { is_expected.to eq ___ }
      it { expect { subject }.not_to change { ___ } }
    end
  end

  describe "#unshift / prepend" do
    subject { array.unshift(*args) }
    let(:array) { [1, 2] }

    context "引数に1つの値を渡した場合" do
      xcontext "配列じゃない値を渡した場合" do
        let(:args) { [3] }   # array.unshift(3) と同等

        it { is_expected.to eq ___ }
        # array.unshift(*args) した結果、array の値がどう変わるかを検証するテスト
        # from に変更前の値を渡し、to に変更後の値を渡す
        it { expect { subject }.to change { array }.from([1, 2]).to ___ }
      end

      xcontext "配列である値を渡した場合" do
        let(:args) { [[3, 4]] }   # array.unshift([3, 4]) と同等

        it { is_expected.to eq ___ }
        it { expect { subject }.to change { array }.from([1, 2]).to ___ }
      end
    end

    xcontext "引数に複数の値を渡した場合" do
      let(:args) { [3, 4, 5] }   # array.unshift(3, 4, 5) と同等

      it { is_expected.to eq ___ }
      it { expect { subject }.to change { array }.from([1, 2]).to ___ }
    end

    xcontext "引数に値を渡さなかった場合" do
      let(:args) { [] }   # array.unshift() と同等

      it { is_expected.to eq ___ }
      it { expect { subject }.not_to change { ___ } }
    end
  end

  describe "#join" do
    subject { array.join(*args) }

    let(:array) { ["homu", "mami", "mado"] }
    let(:args) { [] }

    context "引数を渡した場合" do
      let(:args) { [step] }

      xcontext "`','` を渡した場合" do
        let(:step) { "," }
        it { is_expected.to eq ___ }
      end

      xcontext "`' + '` を渡した場合" do
        let(:step) { " + " }
        it { is_expected.to eq ___ }
      end

      xcontext "`'と'` を渡した場合" do
        let(:step) { "と" }
        it { is_expected.to eq ___ }
      end

      xcontext "`nil` を渡した場合" do
        let(:step) { nil }
        it { is_expected.to eq ___ }
      end

      xcontext "`''` を渡した場合" do
        let(:step) { "" }
        it { is_expected.to eq ___ }
      end

      xcontext "`1234` を渡した場合" do
        let(:step) { 1234 }
        it { expect { subject }.to raise_error ___ }
      end
    end

    xcontext "引数を渡さなかった場合" do
      let(:args) { [] }

      it { is_expected.to eq ___ }
    end

    xcontext "要素に自身が含まれている場合" do
      let(:array) {
        a = ["homu", "mami"]
        a << a
        a
      }

      it { expect { subject }.to raise_error ___ }
    end

    xcontext "配列の要素に数値が混ざっている場合" do
      let(:array) { [1, "homu", "mami", 2] }

      it { is_expected.to eq ___ }
    end
  end

  describe "#first" do
    subject { array.first(*args) }

    context "引数がない場合" do
      let(:args) { [] }   # array.first() と同等

      xcontext "要素がある配列に対して呼び出した場合" do
        let(:array) { [1, 2, 3] }

        it { is_expected.to eq ___ }
      end

      xcontext "空の配列に対して呼び出した場合" do
        let(:array) { [] }
        it { is_expected.to eq ___ }
      end
    end

    context "引数がある場合" do
      let(:array) { [1, 2, 3] }
      let(:args) { [n] }   # array.first(n) と同等

      xcontext "`0` を渡した場合" do
        let(:n) { 0 }
        it { is_expected.to eq [] }
      end

      xcontext "`1` を渡した場合" do
        let(:n) { 1 }
        it { is_expected.to eq ___ }
      end

      xcontext "`2` を渡した場合" do
        let(:n) { 2 }
        it { is_expected.to eq ___ }
      end

      xcontext "`5` を渡した場合" do
        let(:n) { 5 }
        it { is_expected.to eq ___ }
      end

      xcontext "`-1` を渡した場合" do
        let(:n) { -1 }
        it { expect { subject }.to raise_error ___ }
      end

      xcontext "`'2'` を渡した場合" do
        let(:n) { "2" }
        it { expect { subject }.to raise_error ___ }
      end

      xcontext "空の配列に対して呼び出した場合" do
        let(:array) { [] }
        let(:n) { 1 }
        it { is_expected.to eq ___ }
      end
    end
  end

  describe "#last" do
    subject { array.last(*args) }

    context "引数がない場合" do
      let(:args) { [] }   # array.last() と同等

      xcontext "要素がある配列に対して呼び出した場合" do
        let(:array) { [1, 2, 3] }

        it { is_expected.to eq ___ }
      end

      xcontext "空の配列に対して呼び出した場合" do
        let(:array) { [] }
        it { is_expected.to eq ___ }
      end
    end

    context "引数がある場合" do
      let(:array) { [1, 2, 3] }
      let(:args) { [n] }   # array.last(n) と同等

      xcontext "`0` を渡した場合" do
        let(:n) { 0 }
        it { is_expected.to eq [] }
      end

      xcontext "`1` を渡した場合" do
        let(:n) { 1 }
        it { is_expected.to eq ___ }
      end

      xcontext "`2` を渡した場合" do
        let(:n) { 2 }
        it { is_expected.to eq ___ }
      end

      xcontext "`5` を渡した場合" do
        let(:n) { 5 }
        it { is_expected.to eq ___ }
      end

      xcontext "`-1` を渡した場合" do
        let(:n) { -1 }
        it { expect { subject }.to raise_error ___ }
      end

      xcontext "`'2'` を渡した場合" do
        let(:n) { "2" }
        it { expect { subject }.to raise_error ___ }
      end

      xcontext "空の配列に対して呼び出した場合" do
        let(:array) { [] }
        let(:n) { 1 }
        it { is_expected.to eq ___ }
      end
    end
  end

  describe "#map / collect" do
    subject { array.map(&block) }

    xcontext "要素を2倍にする場合" do
      let(:array) { [1, 2, 3] }
      let(:block) { -> (it) { it * 2 } }   # array.map { |it| it * 2 } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "要素を文字数に変換する場合" do
      let(:array) { ["homuhomu", "mami", "an"] }
      let(:block) { -> (it) { ___ } }   # array.map { |it| ___ } と同等

      it { is_expected.to eq [8, 4, 2] }
    end

    xcontext "要素を大文字に変換する場合" do
      let(:array) { ["mami", "mado", "saya"] }
      let(:block) { -> (it) { ___ } }   # array.map { |it| ___ } と同等

      it { is_expected.to eq ["MAMI", "MADO", "SAYA"] }
    end

    xcontext "ブロックの中身が空の場合" do
      let(:array) { [1, 2, 3] }
      let(:block) { -> (it) {  } }   # array.map { |it| } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "block 引数を渡さなかった場合" do
      let(:array) { [1, 2, 3] }
      let(:block) { nil }   # array.map と同等（ブロック引数はない）

      # expect(subject.class).to eq ___ と同等
      it { is_expected.to have_attributes(class: ___) }
    end
  end

  describe "#select / filter / find_all" do
    subject { array.select(&block) }
    let(:array) { [5, 4, 1, 3, 2, 7, 6] }

    xcontext "偶数での値のみ絞り込む場合" do
      let(:block) { -> (it) { it.even? } }   # array.select { |it| it.even? } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "奇数での値のみ絞り込む場合" do
      let(:block) { -> (it) { ___ } }   # array.select { |it| ___ } と同等

      it { is_expected.to eq [5, 1, 3, 7] }
    end

    xcontext "3以下の値で絞り込む場合" do
      let(:block) { -> (it) { ___ } }   # array.select { |it| ___ } と同等

      it { is_expected.to eq [1, 3, 2] }
    end

    xcontext "10以上の値で絞り込む場合" do
      let(:block) { -> (it) { 10 <= it } }   # array.select { |it| 10 <= it } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "ブロックの中身が空の場合" do
      let(:block) { -> (it) {  } }   # array.select { |it| } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "block 引数を渡さなかった場合" do
      let(:block) { nil }   # array.select と同等（ブロック引数はない）

      # expect(subject.class).to eq ___ と同等
      it { is_expected.to have_attributes(class: ___) }
    end
  end

  describe "#count" do
    subject { array.count(*args, &block) }
    let(:array) { [1, 1, 2, 3, 3, 4, 4, 4, 5] }

    xcontext "1 の個数を計算する場合" do
      let(:args) { [1] }    # array.count(1) と同等
      let(:block) { nil }

      it { is_expected.to eq ___ }
    end

    xcontext "4 の個数を計算する場合" do
      let(:args) { [___] }    # array.count(___) と同等
      let(:block) { nil }

      it { is_expected.to eq 3 }
    end

    xcontext "偶数の数を計算する場合" do
      let(:args) { [] }
      let(:block) { -> (it) { it.even? } }   # array.count { |it| it.even? } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "3 よりも大きい数を計算する場合" do
      let(:args) { [] }
      let(:block) { -> (it) { ___ } }   # array.count { |it| ___ } と同等

      it { is_expected.to eq 6 }
    end

    xcontext "位置引数とブロック引数の両方の値を渡している場合" do
      let(:args) { [1] }
      let(:block) { -> (it) { it.even? } }   # array.count(1) { |it| it.even? } と同等

      it { is_expected.to eq ___ }
    end
  end

  describe "#find / detect" do
    subject { array.find(ifnone, &block) }
    let(:array) { [5, 6, 4, 2, 1, 3] }

    xcontext "最初に見つかる偶数の値を検索する場合" do
      let(:ifnone) { nil }
      let(:block) { -> (it) { it.even? } }   # array.find { |it| it.even? } と同等

      it { is_expected.to eq ___  }
    end

    xcontext "最初に見つかる3以下の値を検索する場合" do
      let(:ifnone) { nil }
      let(:block) { -> (it) { ___ } }   # array.find { |it| ___ } と同等

      it { is_expected.to eq 2 }
    end

    xcontext "条件に見つかる値がみつからなかった場合" do
      let(:ifnone) { nil }
      let(:block) { -> (it) { 10 <= it } }   # array.find(ifnone) { |it| 10 <= it } と同等

      it { is_expected.to eq ___ }

      xcontext "ifnone を渡した場合" do
        let(:ifnone) { proc { "見つかりませんでした" } }

        it { is_expected.to eq ___ }
      end

      xcontext "ifnone に例外を発生させる proc を渡した場合" do
        let(:ifnone) { proc { raise ArgumentError, "見つかりませんでした" } }

        it { expect { subject }.to raise_error(___) }
      end
    end

    xcontext "block 引数を渡さなかった場合" do
      let(:ifnone) { nil }
      let(:block) { nil }   # array.find と同等（ブロック引数はない）

      # expect(subject.class).to eq ___ と同等
      it { is_expected.to have_attributes(class: ___) }
    end
  end

  describe "#reject" do
    subject { array.reject(&block) }
    let(:array) { ["homuhomu", "mami", "saka", "an", "madomado"] }

    xcontext "5文字以上の値を削除する場合" do
      let(:block) { -> (it) { ___ } }   # array.select { |it| ___ } と同等

      it { is_expected.to eq ["mami", "saka", "an"] }
    end

    xcontext "先頭の文字が `m` の値を削除する場合" do
      let(:block) { -> (it) { ___ } }   # array.select { |it| ___ } と同等

      it { is_expected.to eq ["homuhomu", "saka", "an"] }
    end

    xcontext "ブロックの中身が空の場合" do
      let(:block) { -> (it) {  } }   # array.select { |it| } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "block 引数を渡さなかった場合" do
      let(:block) { nil }   # array.select と同等（ブロック引数はない）

      # expect(subject.class).to eq Enumerator と同等
      it { is_expected.to have_attributes(class: Enumerator) }
    end
  end
end
