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

      # expect(subject.class).to eq ___ と同等
      it { is_expected.to have_attributes(class: ___) }
    end
  end

  describe "#all?" do
    subject { array.all?(*args, &block) }

    xcontext "全て偶数であるかどうかを判定する" do
      let(:array) { [2, 4, 6] }
      let(:args) { [] }
      let(:block) { -> (it) { it.even? } }   # array.all? { |it| it.even? } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "全て奇数であるかどうかを判定する" do
      let(:array) { [2, 4, 5] }
      let(:args) { [] }
      let(:block) { -> (it) { ___ } }   # array.all? { |it| ___ } と同等

      it { is_expected.to eq false }
    end

    xcontext "全ての要素が5文字以下かどうか判定する" do
      let(:array) { ["homu", "mami", "mado"] }
      let(:args) { [] }
      let(:block) { -> (it) { ___ } }   # array.all? { |it| ___ } と同等

      it { is_expected.to eq true }
    end

    xcontext "全ての文字に m が含まれているかどうか判定する" do
      let(:array) { ["homu", "mami", "mado"] }
      let(:args) { [___] }   # array.all?(___) と同等
      let(:block) { nil }

      it { is_expected.to eq true }
    end
  end

  describe "#any?" do
    subject { array.any?(*args, &block) }

    xcontext "偶数の値があるかどうか判定する" do
      let(:array) { [1, 2, 3] }
      let(:args) { [] }
      let(:block) { -> (it) { it.even? } }   # array.any? { |it| it.even? } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "奇数の値があるかどうか判定する" do
      let(:array) { [2, 4, 6] }
      let(:args) { [] }
      let(:block) { -> (it) { ___ } }   # array.any? { |it| ___ } と同等

      it { is_expected.to eq false }
    end

    xcontext "5文字以上の要素が含まれているかどうか判定する" do
      let(:array) { ["homu", "mami", "mado"] }
      let(:args) { [] }
      let(:block) { -> (it) { ___ } }   # array.any? { |it| ___ } と同等

      it { is_expected.to eq false }
    end

    xcontext "m が含まれている文字があるかどうか判定する" do
      let(:array) { ["saya", "mami", "mado"] }
      let(:args) { [___] }   # array.any?(___) と同等
      let(:block) { nil }

      it { is_expected.to eq true }
    end
  end

  describe "#none?" do
    subject { array.none?(*args, &block) }

    xcontext "全て nil じゃないかどうか判定する" do
      let(:array) { ["homu", 1, nil] }
      let(:args) { [] }
      let(:block) { -> (it) { ___ } }   # array.none? { |it| ___ } と同等

      it { is_expected.to eq false }
    end

    xcontext "全て空文字列じゃないかどうか判定する" do
      let(:array) { ["homu", "mami", "mado"] }
      let(:args) { [] }
      let(:block) { -> (it) { ___ } }   # array.none? { |it| ___ } と同等

      it { is_expected.to eq true }
    end

    xcontext "全て5文字以下じゃないかどうか判定する" do
      let(:array) { ["homuhomu", "mami", "mado"] }
      let(:args) { [] }
      let(:block) { -> (it) { ___ } }   # array.none? { |it| ___ } と同等

      it { is_expected.to eq false }
    end

    xcontext "先頭が m からはじまる文字が含まれていないかどうか判定する" do
      let(:array) { ["homu", "saya", "an"] }
      let(:args) { [___] }   # array.none?(___) と同等
      let(:block) { nil }

      it { is_expected.to eq true }
    end
  end

  describe "#one?" do
    subject { array.one?(*args, &block) }

    xcontext "nil の値が1つだけかどうか判定する" do
      let(:array) { ["", 0, nil, false] }
      let(:args) { [] }
      let(:block) { -> (it) { ___ } }   # array.one? { |it| ___ } と同等

      it { is_expected.to eq true }
    end

    xcontext "真の値が1つだけかどうか判定する" do
      let(:array) { ["", 0, nil, false] }
      let(:args) { [] }
      let(:block) { -> (it) { it } }   # array.one? { |it| it } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "末尾の値が a の値が1つかどうか判定する" do
      let(:array) { ["homu", "saya", "an"] }
      let(:args) { [___] }   # array.one?(___) と同等
      let(:block) { nil }

      it { is_expected.to eq true }
    end
  end

  describe "#sort" do
    subject { array.sort }

    xcontext "数値の配列の場合" do
      let(:array) { [9, 1, 5, 7, 3, 2, 4, 10, 6, 8] }

      it { is_expected.to eq ___ }
    end

    xcontext "文字列の配列の場合" do
      let(:array) { ["mado", "Mami", "an", "homu", "saya"] }

      it { is_expected.to eq ___ }
    end

    xcontext "数値の文字列の配列の場合" do
      let(:array) { ["009", "104", "22222", "42", "3", "108"] }

      it { is_expected.to eq ___ }
    end

    xcontext "数値と文字列が混ざっている配列の場合" do
      let(:array) { ["homu", 42, "mami", 108] }

      it { expect { subject }.to raise_error(___) }
    end
  end

  describe "#sort_by" do
    subject { array.sort_by(&block) }

    xcontext "数値の文字列を数値としてソートする場合" do
      let(:array) { ["009", "104", "22222", "42", "3", "108"] }
      let(:block) { -> (it) { ___ } }   # array.sort_by { |it| ___ } と同等

      it { is_expected.to eq ["3", "009", "42", "104", "108", "22222"] }
    end

    xcontext "文字列の長さでソートする場合" do
      let(:array) { ["homuhomu", "mami", "an", "madomado", "saya"] }
      let(:block) { -> (it) { ___ } }   # array.sort_by { |it| ___ } と同等

      it { is_expected.to eq ["an", "mami", "saya", "homuhomu", "madomado"] }
    end

    xcontext "大文字小文字関係なくソートする場合" do
      let(:array) { ["Homu", "mami", "Mado", "SAYA", "an"] }
      let(:block) { -> (it) { ___ } }   # array.sort_by { |it| ___ } と同等

      it { is_expected.to eq ["an", "Homu", "Mado", "mami", "SAYA"] }
    end
  end

  describe "#min" do
    subject { array.min }

    xcontext "数値のみの配列の場合" do
      let(:array) { [9, 1, 5, 7, 3, 2, 4, 10, 6, 8] }

      it { is_expected.to eq ___ }
    end

    xcontext "文字列のみの配列の場合" do
      let(:array) { ["Homu", "mami", "Mado", "SAYA", "an"] }

      it { is_expected.to eq ___ }
    end

    xcontext "数値と文字列が混ざっている配列の場合" do
      let(:array) { ["homu", 42, "mami", 108] }

      it { expect { subject }.to raise_error(___) }
    end
  end

  describe "#min_by" do
    subject { array.min_by(&block) }

    xcontext "文字列の長さの最小値を取得する場合" do
      let(:array) { ["homuhomu", "mami", "an", "madomado", "saya"] }
      let(:block) { -> (it) { ___ } }   # array.min_by { |it| ___ } と同等

      it { is_expected.to eq ___ }
    end

    xcontext "数値の文字列と数値が混ざっている配列で『数値』として最小値を取得する場合" do
      let(:array) { ["009", 104, "22222", 42, "3", 108] }
      let(:block) { -> (it) { ___ } }   # array.min_by { |it| ___ } と同等

      it { is_expected.to eq "3" }
    end

    xcontext "数値の中の `0` の数が一番少ない数値を取得する場合" do
      let(:array) { [100, 1000, 10, 10000] }
      let(:block) { -> (it) { ___ } }   # array.min_by { |it| ___ } と同等

      it { is_expected.to eq 10 }
    end
  end

  describe "#max" do
    subject { array.max }

    xcontext "数値のみの配列の場合" do
      let(:array) { [9, 1, 5, 7, 3, 2, 4, 10, 6, 8] }

      it { is_expected.to eq ___ }
    end

    xcontext "文字列のみの配列の場合" do
      let(:array) { ["Homu", "mami", "Mado", "SAYA", "an"] }

      it { is_expected.to eq ___ }
    end

    xcontext "数値と文字列が混ざっている配列の場合" do
      let(:array) { ["homu", 42, "mami", 108] }

      it { expect { subject }.to raise_error(___) }
    end
  end

  describe "#max_by" do
    subject { array.max_by(&block) }

    xcontext "文字列の長さの最大値を取得する場合" do
      let(:array) { ["homuhomu", "mami", "an", "madomado", "saya"] }
      let(:block) { -> (it) { ___ } }   # array.max_by { |it| it.length } と同等

      it { is_expected.to eq "homuhomu" }
    end

    xcontext "数値の文字列と数値が混ざっている配列で『文字列』として最大値を取得する場合" do
      let(:array) { ["009", 104, "22222", 42, "3", 108] }
      let(:block) { -> (it) { ___ } }   # array.max_by { |it| it.to_s } と同等

      it { is_expected.to eq 42 }
    end

    xcontext "`m` の数が一番多い文字列を取得する場合" do
      let(:array) { ["homu", "mami", "mado", "an", "saya"] }
      let(:block) { -> (it) { ___ } }   # array.max_by { |it| it.count("m") } と同等

      it { is_expected.to eq "mami" }
    end
  end

  describe "#concat" do
    subject { array.concat(*args) }

    let(:array) { [1, 2] }

    xcontext "引数に配列を渡した場合" do
      let(:args) { [["homu", "mami"]] }   # array.concat(["homu", "mami"]) と同等

      it { is_expected.to eq [1, 2, "homu", "mami"] }
      # array の値がどう変わるかを検証するテスト
      # from に変更前の値を渡し、to に変更後の値を渡す
      it { expect { subject }.to change { array }.from([1, 2]).to(___) }
    end

    xcontext "引数に複数の配列を渡した場合" do
      let(:args) { [["homu", "mami"], ___] }   # array.concat(["homu", "mami"], ___) と同等

      it { is_expected.to eq [1, 2, "homu", "mami", "mado", 0] }
      # array の値がどう変わるかを検証するテスト
      # from に変更前の値を渡し、to に変更後の値を渡す
      it { expect { subject }.to change { array }.from([1, 2]).to([1, 2, "homu", "mami", "mado", 0]) }
    end

    xcontext "引数に空の配列を渡した場合" do
      let(:args) { [[]] }   # array.concat([]) と同等

      it { is_expected.to eq ___ }
      # array の値がどう変わるかを検証するテスト
      # from に変更前の値を渡し、to に変更後の値を渡す
      it { expect { subject }.not_to change { ___ } }
    end

    xcontext "引数に配列以外を渡した場合" do
      let(:args) { [42] }   # array.concat(42) と同等

      it { expect { subject }.to raise_error(___) }
    end
  end

  describe "#compact" do
    subject { array.compact }

    xcontext "要素に nil が含まれている場合" do
      let(:array) { [1, nil, 3, nil] }

      it { is_expected.to eq ___ }
    end

    xcontext "要素に nil と false が含まれている場合" do
      let(:array) { [1, nil, ___, false, nil] }

      it { is_expected.to eq [1, 3, ___] }
    end

    xcontext "要素に nil が含まれていない場合" do
      let(:array) { [1, 2, 3] }

      it { is_expected.to eq ___ }
    end
  end

  describe "#delete" do
    subject { array.delete(*args, &block) }

    xcontext "0 の値を削除する場合" do
      let(:array) { [0, 1, 2, 0, 3, 0, 4] }
      let(:args) { [0] }   # array.delete(0) と同等
      let(:block) { nil }

      it { is_expected.to eq ___ }
      # array の値がどう変わるかを検証するテスト
      # to に変更後の値を渡す
      it { expect { subject }.to change { array }.to ___ }
    end

    xcontext "nil の値を削除する場合" do
      let(:array) { [nil, nil, 1, 2, nil, 3] }
      let(:args) { [nil] }   # array.delete(nil) と同等
      let(:block) { nil }

      it { is_expected.to eq ___ }
      # array の値がどう変わるかを検証するテスト
      # to に変更後の値を渡す
      it { expect { subject }.to change { array }.to ___ }
    end

    xcontext "削除する値がみつからなかった場合" do
      let(:array) { [0, 1, 2, 0, 3, 0, 4] }

      xcontext "引数を渡した場合" do
        let(:args) { [-1] }
        let(:block) { nil }

        it { is_expected.to eq ___ }
        it { expect { subject }.not_to change { ___ } }
      end

      xcontext "ブロック引数を渡した場合" do
        let(:args) { [-1] }
        let(:block) { -> (it) { "みつからなかったよ" } }  # array.delete { |it| "みつからなかったよ" }

        it { is_expected.to eq ___ }
        it { expect { subject }.not_to change { ___ } }
      end
    end
  end

  describe "#drop" do
    subject { array.drop(n) }
    let(:array) { [1, 2, 3, 4, 5] }

    xcontext "先頭3つ分を削除する場合" do
      let(:n) { 3 }

      it { is_expected.to eq ___ }
    end

    xcontext "先頭10つ分を削除する場合" do
      let(:n) { 10 }

      it { is_expected.to eq ___ }
    end

    xcontext "先頭0つ分を削除する場合" do
      let(:n) { 0 }

      it { is_expected.to eq ___ }
    end

    xcontext "先頭-2つ分を削除する場合" do
      let(:n) { -2 }

      it { expect { subject }.to raise_error(___) }
    end
  end

  describe "#drop_while" do
    subject { array.drop_while(&block) }

    xcontext "先頭から3以下の値を削除する場合" do
      let(:array) { [3, 1, 2, 4, 2, 3, 5] }
      let(:block) { -> (it) { ___ } }   # array.drop_while { |it| ___ }

      it { is_expected.to eq [4, 2, 3, 5] }
    end

    xcontext "先頭から奇数の値を削除する場合" do
      let(:array) { [3, 1, 5, 2, 5, 4, 3] }
      let(:block) { -> (it) { it.odd? } }   # array.drop_while { |it| it.odd? }

      it { is_expected.to eq ___ }
    end
  end

  describe "#take" do
    subject { array.take(n) }
    let(:array) { [1, 2, 3, 4, 5] }

    xcontext "先頭3つ分を取得する場合" do
      let(:n) { 3 }

      it { is_expected.to eq ___ }
    end

    xcontext "先頭10つ分を取得する場合" do
      let(:n) { 10 }

      it { is_expected.to eq ___ }
    end

    xcontext "先頭0つ分を取得する場合" do
      let(:n) { 0 }

      it { is_expected.to eq [] }
    end

    xcontext "先頭-2つ分を取得する場合" do
      let(:n) { -2 }

      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end

  describe "#take_while" do
    subject { array.take_while(&block) }

    xcontext "先頭から3以下の値を取得する場合" do
      let(:array) { [3, 1, 2, 4, 2, 3, 5] }
      let(:block) { -> (it) { it <= 3 } }   # array.take_while { |it| it <= 3 }

      it { is_expected.to eq ___ }
    end

    xcontext "先頭から奇数の値を取得する場合" do
      let(:array) { [3, 1, 5, 2, 5, 4, 3] }
      let(:block) { -> (it) { ___ } }   # array.take_while { |it| ___ }

      it { is_expected.to eq [3, 1, 5] }
    end
  end
end
