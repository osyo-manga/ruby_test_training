require "rspec"

# docs: https://docs.ruby-lang.org/ja/latest/class/Array.html
RSpec.describe Array do
  describe "#size" do
    subject { array.size }

    let(:array) { [1, 2, "homu", :mami] }

    it { is_expected.to eq 4 }

    context "nil が混ざってる場合" do
      let(:array) { [nil, 2, nil, 4] }

      it { is_expected.to eq 4 }
    end

    context "空の配列の場合" do
      let(:array) { [] }

      it { is_expected.to eq 0 }
    end
  end

  describe "#at" do
    subject { array.at(nth) }

    let(:array) { ["homu", "mami", "mado"] }

    context "`0` を渡した場合" do
      let(:nth) { 0 }

      it { is_expected.to eq "homu" }
    end

    context "`1` を渡した場合" do
      let(:nth) { 1 }

      it { is_expected.to eq "mami" }
    end

    context "`5` を渡した場合" do
      let(:nth) { 5 }

      it { is_expected.to eq nil }
    end

    context "`-1` を渡した場合" do
      let(:nth) { -1 }

      it { is_expected.to eq "mado" }
    end

    context "`-2` を渡した場合" do
      let(:nth) { -2 }

      it { is_expected.to eq "mami" }
    end

    context "`-5` を渡した場合" do
      let(:nth) { -5 }

      it { is_expected.to eq nil }
    end

    context "引数に数値以外の価を渡した場合" do
      let(:nth) { "0" }

      it { expect { subject }.to raise_error TypeError }
    end
  end

  describe "#[]" do
    subject { array[*args] }

    let(:array) { ["homu", "mami", "mado", "saya", "an"] }

    context "引数に数値を渡した場合" do
      let(:args) { [nth] }   # array[nth] と同等

      context "`0` を渡した場合" do
        let(:nth) { 0 }

        it { is_expected.to eq "homu" }
      end

      context "`1` を渡した場合" do
        let(:nth) { 1 }

        it { is_expected.to eq "mami" }
      end

      context "`5` を渡した場合" do
        let(:nth) { 5 }

        it { is_expected.to eq nil }
      end

      context "`-1` を渡した場合" do
        let(:nth) { -1 }

        it { is_expected.to eq "an" }
      end

      context "`-2` を渡した場合" do
        let(:nth) { -2 }

        it { is_expected.to eq "saya" }
      end

      context "`-5` を渡した場合" do
        let(:nth) { -5 }

        it { is_expected.to eq "homu" }
      end

      context "`-7` を渡した場合" do
        let(:nth) { -7 }

        it { is_expected.to eq nil }
      end
    end

    context "引数に Range を渡した場合" do
      let(:args) { [range] }   # array[range] と同等

      context "1〜3 の範囲(3 を含む) を渡した場合" do
        let(:range) { 1..3 }

        it { is_expected.to eq ["mami", "mado", "saya"] }
      end

      context "1〜3 の範囲(3 を含まない) を渡した場合" do
        let(:range) { 1...3 }

        it { is_expected.to eq ["mami", "mado"] }
      end

      context "先頭がマイナスの値の範囲を渡した場合" do
        let(:range) { -3..4 }

        it { is_expected.to eq ["mado", "saya", "an"] }
      end

      context "終端がマイナスの値の範囲を渡した場合" do
        let(:range) { -4..-2 }

        it { is_expected.to eq ["mami", "mado", "saya"] }
      end

      context "始点 > 終点になるような範囲を渡した場合" do
        let(:range) { 3..1 }

        it { is_expected.to eq [] }
      end

      context "終端が範囲外になるような範囲を渡した場合" do
        let(:range) { 2..14 }

        it { is_expected.to eq ["mado", "saya", "an"] }
      end

      context "先端と終端が範囲外になるような範囲を渡した場合" do
        let(:range) { 10..14 }

        it { is_expected.to eq nil }
      end
    end

    context "引数が2つの場合" do
      let(:args) { [start, length] }   # array[start, length] と同等

      context "start に正の数値を渡した場合" do
        let(:start) { 1 }
        let(:length) { 3 }

        it { is_expected.to eq ["mami", "mado", "saya"] }
      end

      context "start に負の数値を渡した場合" do
        let(:start) { -3 }
        let(:length) { 2 }

        it { is_expected.to eq ["mado", "saya"] }
      end

      context "length に要素数を越える値を渡した場合" do
        let(:start) { 2 }
        let(:length) { 6 }

        it { is_expected.to eq ["mado", "saya", "an"] }
      end

      context "length に負の数値を渡した場合" do
        let(:start) { 2 }
        let(:length) { -2 }

        it { is_expected.to eq nil }
      end
    end
  end

  describe "#<<" do
    subject { array << obj }

    let(:array) { [1, 2] }

    context "`3` を渡した場合" do
      let(:obj) { 3 }   # array << 3 と同等

      it { is_expected.to eq [1, 2, 3] }
      # array << obj した結果、array の値がどう変わるかを検証するテスト
      # from に変更前の値を渡し、to に変更後の値を渡す
      it { expect { subject }.to change { array }.from([1, 2]).to [1, 2, 3] }
    end

    context "配列を渡した場合" do
      let(:obj) { [3, 4] }   # array << [3, 4] と同等

      it { is_expected.to eq [1, 2, [3, 4]] }
      it { expect { subject }.to change { array }.from([1, 2]).to [1, 2, [3, 4]] }
    end

    context "nil を渡した場合" do
      let(:obj) { nil }   # array << 3 と同等

      it { is_expected.to eq [1, 2, nil] }
      it { expect { subject }.to change { array }.from([1, 2]).to [1, 2, nil] }
    end
  end

  describe "#push / append" do
    subject { array.push(*args) }
    let(:array) { [1, 2] }

    context "引数に1つの値を渡した場合" do
      context "配列じゃない値を渡した場合" do
        let(:args) { [3] }   # array.push(3) と同等

        it { is_expected.to eq [1, 2, 3] }
        # array.push(*args) した結果、array の値がどう変わるかを検証するテスト
        # from に変更前の値を渡し、to に変更後の値を渡す
        it { expect { subject }.to change { array }.from([1, 2]).to [1, 2, 3] }
      end

      context "配列である値を渡した場合" do
        let(:args) { [[3, 4]] }   # array.push([3, 4]) と同等

        it { is_expected.to eq [1, 2, [3, 4]] }
        it { expect { subject }.to change { array }.from([1, 2]).to [1, 2, [3, 4]] }
      end
    end

    context "引数に複数の値を渡した場合" do
      let(:args) { [3, 4, 5] }   # array.push(3, 4, 5) と同等

      it { is_expected.to eq [1, 2, 3, 4, 5] }
      it { expect { subject }.to change { array }.from([1, 2]).to [1, 2, 3, 4, 5] }
    end

    context "引数に値を渡さなかった場合" do
      let(:args) { [] }   # array.push() と同等

      it { is_expected.to eq [1, 2] }
      it { expect { subject }.not_to change { array } }
    end
  end

  describe "#unshift / prepend" do
    subject { array.unshift(*args) }
    let(:array) { [1, 2] }

    context "引数に1つの値を渡した場合" do
      context "配列じゃない値を渡した場合" do
        let(:args) { [3] }   # array.unshift(3) と同等

        it { is_expected.to eq [3, 1, 2] }
        # array.unshift(*args) した結果、array の値がどう変わるかを検証するテスト
        # from に変更前の値を渡し、to に変更後の値を渡す
        it { expect { subject }.to change { array }.from([1, 2]).to [3, 1, 2] }
      end

      context "配列である値を渡した場合" do
        let(:args) { [[3, 4]] }   # array.unshift([3, 4]) と同等

        it { is_expected.to eq [[3, 4], 1, 2] }
        it { expect { subject }.to change { array }.from([1, 2]).to [[3, 4], 1, 2] }
      end
    end

    context "引数に複数の値を渡した場合" do
      let(:args) { [3, 4, 5] }   # array.unshift(3, 4, 5) と同等

      it { is_expected.to eq [3, 4, 5, 1, 2] }
      it { expect { subject }.to change { array }.from([1, 2]).to [3, 4, 5, 1, 2] }
    end

    context "引数に値を渡さなかった場合" do
      let(:args) { [] }   # array.unshift() と同等

      it { is_expected.to eq [1, 2] }
      it { expect { subject }.not_to change { array } }
    end
  end

  describe "#join" do
    subject { array.join(*args) }

    let(:array) { ["homu", "mami", "mado"] }
    let(:args) { [] }

    context "引数を渡した場合" do
      let(:args) { [step] }

      context "`','` を渡した場合" do
        let(:step) { "," }
        it { is_expected.to eq "homu,mami,mado" }
      end

      context "`' + '` を渡した場合" do
        let(:step) { " + " }
        it { is_expected.to eq "homu + mami + mado" }
      end

      context "`'と'` を渡した場合" do
        let(:step) { "と" }
        it { is_expected.to eq "homuとmamiとmado" }
      end

      context "`nil` を渡した場合" do
        let(:step) { nil }
        it { is_expected.to eq "homumamimado" }
      end

      context "`''` を渡した場合" do
        let(:step) { "" }
        it { is_expected.to eq "homumamimado" }
      end

      context "`1234` を渡した場合" do
        let(:step) { 1234 }
        it { expect { subject }.to raise_error TypeError }
      end
    end

    context "引数を渡さなかった場合" do
      let(:args) { [] }

      it { is_expected.to eq "homumamimado" }
    end

    context "要素に自身が含まれている場合" do
      let(:array) {
        a = ["homu", "mami"]
        a << a
        a
      }

      it { expect { subject }.to raise_error ArgumentError }
    end

    context "配列の要素に数値が混ざっている場合" do
      let(:array) { [1, "homu", "mami", 2] }

      it { is_expected.to eq "1homumami2" }
    end
  end

  describe "#first" do
    subject { array.first(*args) }

    context "引数がない場合" do
      let(:args) { [] }   # array.first() と同等

      context "要素がある配列に対して呼び出した場合" do
        let(:array) { [1, 2, 3] }

        it { is_expected.to eq 1 }
      end

      context "空の配列に対して呼び出した場合" do
        let(:array) { [] }
        it { is_expected.to eq nil }
      end
    end

    context "引数がある場合" do
      let(:array) { [1, 2, 3] }
      let(:args) { [n] }   # array.first(n) と同等

      context "`0` を渡した場合" do
        let(:n) { 0 }
        it { is_expected.to eq [] }
      end

      context "`1` を渡した場合" do
        let(:n) { 1 }
        it { is_expected.to eq [1] }
      end

      context "`2` を渡した場合" do
        let(:n) { 2 }
        it { is_expected.to eq [1, 2] }
      end

      context "`5` を渡した場合" do
        let(:n) { 5 }
        it { is_expected.to eq [1, 2, 3] }
      end

      context "`-1` を渡した場合" do
        let(:n) { -1 }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context "`'2'` を渡した場合" do
        let(:n) { "2" }
        it { expect { subject }.to raise_error TypeError }
      end

      context "空の配列に対して呼び出した場合" do
        let(:array) { [] }
        let(:n) { 1 }
        it { is_expected.to eq [] }
      end
    end
  end

  describe "#last" do
    subject { array.last(*args) }

    context "引数がない場合" do
      let(:args) { [] }   # array.last() と同等

      context "要素がある配列に対して呼び出した場合" do
        let(:array) { [1, 2, 3] }

        it { is_expected.to eq 3 }
      end

      context "空の配列に対して呼び出した場合" do
        let(:array) { [] }
        it { is_expected.to eq nil }
      end
    end

    context "引数がある場合" do
      let(:array) { [1, 2, 3] }
      let(:args) { [n] }   # array.last(n) と同等

      context "`0` を渡した場合" do
        let(:n) { 0 }
        it { is_expected.to eq [] }
      end

      context "`1` を渡した場合" do
        let(:n) { 1 }
        it { is_expected.to eq [3] }
      end

      context "`2` を渡した場合" do
        let(:n) { 2 }
        it { is_expected.to eq [2, 3] }
      end

      context "`5` を渡した場合" do
        let(:n) { 5 }
        it { is_expected.to eq [1, 2, 3] }
      end

      context "`-1` を渡した場合" do
        let(:n) { -1 }
        it { expect { subject }.to raise_error ArgumentError }
      end

      context "`'2'` を渡した場合" do
        let(:n) { "2" }
        it { expect { subject }.to raise_error TypeError }
      end

      context "空の配列に対して呼び出した場合" do
        let(:array) { [] }
        let(:n) { 1 }
        it { is_expected.to eq [] }
      end
    end
  end

  describe "#map / collect" do
    subject { array.map(&block) }

    context "要素を2倍にする場合" do
      let(:array) { [1, 2, 3] }
      let(:block) { -> (it) { it * 2 } }   # array.map { |it| it * 2 } と同等

      it { is_expected.to eq [2, 4, 6] }
    end

    context "要素を文字数に変換する場合" do
      let(:array) { ["homuhomu", "mami", "an"] }
      let(:block) { -> (it) { it.size } }   # array.map { |it| it.size } と同等

      it { is_expected.to eq [8, 4, 2] }
    end

    context "要素を大文字に変換する場合" do
      let(:array) { ["mami", "mado", "saya"] }
      let(:block) { -> (it) { it.upcase } }   # array.map { |it| it.upcase } と同等

      it { is_expected.to eq ["MAMI", "MADO", "SAYA"] }
    end

    context "ブロックの中身が空の場合" do
      let(:array) { [1, 2, 3] }
      let(:block) { -> (it) {  } }   # array.map { |it| } と同等

      it { is_expected.to eq [nil, nil, nil] }
    end

    context "block 引数を渡さなかった場合" do
      let(:array) { [1, 2, 3] }
      let(:block) { nil }   # array.map と同等（ブロック引数はない）

      # expect(subject.class).to eq Enumerator と同等
      it { is_expected.to have_attributes(class: Enumerator) }
    end
  end

  describe "#select / filter / find_all" do
    subject { array.select(&block) }
    let(:array) { [5, 4, 1, 3, 2, 7, 6] }

    context "偶数での値のみ絞り込む場合" do
      let(:block) { -> (it) { it.even? } }   # array.select { |it| it.even? } と同等

      it { is_expected.to eq [4, 2, 6] }
    end

    context "奇数での値のみ絞り込む場合" do
      let(:block) { -> (it) { it.odd? } }   # array.select { |it| it.odd? } と同等

      it { is_expected.to eq [5, 1, 3, 7] }
    end

    context "3以下の値で絞り込む場合" do
      let(:block) { -> (it) { it <= 3 } }   # array.select { |it| it <= 3 } と同等

      it { is_expected.to eq [1, 3, 2] }
    end

    context "10以上の値で絞り込む場合" do
      let(:block) { -> (it) { 10 <= it } }   # array.select { |it| 10 <= it } と同等

      it { is_expected.to eq [] }
    end

    context "ブロックの中身が空の場合" do
      let(:block) { -> (it) {  } }   # array.select { |it| } と同等

      it { is_expected.to eq [] }
    end

    context "block 引数を渡さなかった場合" do
      let(:block) { nil }   # array.select と同等（ブロック引数はない）

      # expect(subject.class).to eq Enumerator と同等
      it { is_expected.to have_attributes(class: Enumerator) }
    end
  end

  describe "#count" do
    subject { array.count(*args, &block) }
    let(:array) { [1, 1, 2, 3, 3, 4, 4, 4, 5] }

    context "1 の個数を計算する場合" do
      let(:args) { [1] }    # array.count(1) と同等
      let(:block) { nil }

      it { is_expected.to eq 2 }
    end

    context "4 の個数を計算する場合" do
      let(:args) { [4] }    # array.count(4) と同等
      let(:block) { nil }

      it { is_expected.to eq 3 }
    end

    context "偶数の数を計算する場合" do
      let(:args) { [] }
      let(:block) { -> (it) { it.even? } }   # array.count { |it| it.even? } と同等

      it { is_expected.to eq 4 }
    end

    context "3 よりも大きい数を計算する場合" do
      let(:args) { [] }
      let(:block) { -> (it) { 3 <= it } }   # array.count { |it| 3 <= it } と同等

      it { is_expected.to eq 6 }
    end

    context "位置引数とブロック引数の両方の値を渡している場合" do
      let(:args) { [1] }
      let(:block) { -> (it) { it.even? } }   # array.count(1) { |it| it.even? } と同等

      it { is_expected.to eq 2 }
    end
  end

  describe "#find / detect" do
    subject { array.find(ifnone, &block) }
    let(:array) { [5, 6, 4, 2, 1, 3] }

    context "最初に見つかる偶数の値を検索する場合" do
      let(:ifnone) { nil }
      let(:block) { -> (it) { it.even? } }   # array.find { |it| it.even? } と同等

      it { is_expected.to eq 6 }
    end

    context "最初に見つかる3以下の値を検索する場合" do
      let(:ifnone) { nil }
      let(:block) { -> (it) { it <= 3 } }   # array.find { |it| it <= 3 } と同等

      it { is_expected.to eq 2 }
    end

    context "条件に見つかる値がみつからなかった場合" do
      let(:ifnone) { nil }
      let(:block) { -> (it) { 10 <= it } }   # array.find(ifnone) { |it| 10 <= it } と同等

      it { is_expected.to eq nil }

      context "ifnone に" do
        let(:ifnone) { proc { "見つかりませんでした" } }

        it { is_expected.to eq "見つかりませんでした" }
      end

      context "ifnone に例外を発生させる proc を渡した場合" do
        let(:ifnone) { proc { raise ArgumentError, "見つかりませんでした" } }

        it { expect { subject }.to raise_error(ArgumentError) }
      end
    end

    context "block 引数を渡さなかった場合" do
      let(:ifnone) { nil }
      let(:block) { nil }   # array.find と同等（ブロック引数はない）

      # expect(subject.class).to eq Enumerator と同等
      it { is_expected.to have_attributes(class: Enumerator) }
    end
  end

  describe "#reject" do
    subject { array.reject(&block) }
    let(:array) { ["homuhomu", "mami", "saka", "an", "madomado"] }

    context "5文字以上の値を削除する場合" do
      let(:block) { -> (it) { 5 <= it.length } }   # array.select { |it| 5 <= it.length } と同等

      it { is_expected.to eq ["mami", "saka", "an"] }
    end

    context "先頭の文字が `m` の値を削除する場合" do
      let(:block) { -> (it) { it =~ /^m/ } }   # array.select { |it| it =~ /^m/ } と同等

      it { is_expected.to eq ["homuhomu", "saka", "an"] }
    end

    context "ブロックの中身が空の場合" do
      let(:block) { -> (it) {  } }   # array.select { |it| } と同等

      it { is_expected.to eq ["homuhomu", "mami", "saka", "an", "madomado"] }
    end

    context "block 引数を渡さなかった場合" do
      let(:block) { nil }   # array.select と同等（ブロック引数はない）

      # expect(subject.class).to eq Enumerator と同等
      it { is_expected.to have_attributes(class: Enumerator) }
    end
  end

  describe "#all?" do
    subject { array.all?(*args, &block) }

    context "全て偶数であるかどうかを判定する" do
      let(:array) { [2, 4, 6] }
      let(:args) { [] }
      let(:block) { -> (it) { it.even? } }   # array.all? { |it| it.even? } と同等

      it { is_expected.to eq true }
    end

    context "全て奇数であるかどうかを判定する" do
      let(:array) { [2, 4, 5] }
      let(:args) { [] }
      let(:block) { -> (it) { it.odd? } }   # array.all? { |it| it.odd? } と同等

      it { is_expected.to eq false }
    end

    context "全ての要素が5文字以下かどうか判定する" do
      let(:array) { ["homu", "mami", "mado"] }
      let(:args) { [] }
      let(:block) { -> (it) { it.length <= 5 } }   # array.all? { |it| it.length <= 5 } と同等

      it { is_expected.to eq true }
    end

    context "全ての文字に m が含まれているかどうか判定する" do
      let(:array) { ["homu", "mami", "mado"] }
      let(:args) { [/m/] }   # array.all?(/m/) と同等
      let(:block) { nil }

      it { is_expected.to eq true }
    end
  end
end
