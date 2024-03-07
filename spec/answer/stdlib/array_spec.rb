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
    let(:array) { [1, 2, 3] }

    context "block 引数を渡した場合" do
      context "何かしら処理がある場合" do
        context "2倍にした場合" do
          let(:block) { -> (it) { it * 2 } }   # array.map { |it| it * 2 } と同等

          it { is_expected.to eq [2, 4, 6] }
        end

        context "メソッドを呼び出した場合" do
          let(:array) { ["homu", "mami", "mado"] }
          let(:block) { -> (it) { it.upcase } }   # array.map { |it| it.upcase } と同等

          it { is_expected.to eq ["HOMU", "MAMI", "MADO"] }
        end
      end

      context "ブロックの中身が空の場合" do
        let(:block) { -> (it) {  } }   # array.map { |it| } と同等

        it { is_expected.to eq [nil, nil, nil] }
      end
    end

    context "block 引数を渡さなかった場合" do
      let(:block) { nil }   # array.map と同等（ブロック引数はない）

      # expect(subject.class).to eq Enumerator と同等
      it { is_expected.to have_attributes(class: Enumerator) }
    end
  end
end
