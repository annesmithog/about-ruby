# about-ruby

## 目次

- [前提](#前提)
- [変数](#変数)
- [定数](#定数)
- [配列定数](#配列定数)
- [配列](#配列)
- [制御構造](#制御構造)
- [式](#式)
- [キャスト](#キャスト)
- [メソッド](#メソッド)
- [クラス](#クラス)
- [モジュール](#モジュール)
- [テスト](#テスト)
- [例外](#例外)
- [ライブラリ](#ライブラリ)
- [Extra](#extra)
- [データ構造](#データ構造)

[⬆︎目次トップに戻る](#目次)

## 前提

**環境** - Ruby 3.3で実行しています。

**インタラクティブなRuby** - Rubyの対話インターフェースです。ターミナル等にて、`irb`で起動、`quit`で終了します。

**RDoc** - Rubyのドキュメントをターミナル等で閲覧するツールです。ターミナル等にて`ri`で起動、`q`で終了します。

**出力** - このリポジトリでは、説明のために出力を多く使用します。
```rb
print "Hello"   # 改行なし
puts "Hello"    # 改行あり
p "Hello"       # 詳細
```

**コメントアウト** - 以下の方法でコメントアウトできます。
```rb
# コメント 1

=begin
コメント 2
=end
```

**プログラム実行** - `ruby [プログラム].rb`で実行します。
```sh
ruby ./sample/hello_world.rb
```

[⬆︎目次に戻る](#目次)

## 変数

**変数** - 一般的な変数です。Rubyの変数には型がありません。
```rb
name = 'Anne'
age = 21
```

[⬆︎目次に戻る](#目次)

## 定数

**定数** - 一般的な定数です。アルファベット大文字で始まる識別子が定数とされます。

**再代入：可能(警告)、破壊的変更：可能**
```rb
Ver = 'ver 1.0.0'
puts Ver
```

**再代入：可能(警告)、破壊的変更：不可**
```rb
VER = 'ver 2.0.0'
VER.freeze
puts VER
```

**再代入：不可、破壊的変更：可能**
```rb
module VER
  DEFAULT_VER = '3.0.0'
end
VER::DEFAULT_VER.freeze
puts VER::DEFAULT_VER
```

**再代入：不可、破壊的変更：不可**
```rb
module VER
  DEFAULT_VER = '4.0.0'.freeze
end
VER.freeze
puts VER::DEFAULT_VER
```

[⬆︎目次に戻る](#目次)

## 配列定数

**(危険)配列自体を不変にする**
```rb
LANGUAGES = ['ja', 'en'].freeze
puts LANGUAGES[0]
```

**(面倒)各要素を不変にする**
```rb
LANGUAGES = ['ja'.freeze, 'en'.freeze]
puts LANGUAGES[0]
```

**(おすすめ)mapで各要素を不変にする**
```rb
LANGUAGES = ['ja', 'en'].map(&:freeze).freeze
puts LANGUAGES[0]
```

[⬆︎目次に戻る](#目次)

## 配列

データ構造一覧は[こちら](#データ構造)。

**Array** - 詳細は[こちら](./datastructure/array/README.md)。
```rb
numbers = [10, 20, 30]

numbers.each do |number|
  puts number
end
```

**ハッシュ** - 詳細は[こちら](./datastructure/hash/README.md)。
```rb
numbers = {'one' => 1, 'two' => 2, 'three' => 3}

numbers.each do |key, value|
  puts "#{key} => #{value}"
end
```

**シンボル** - 詳細は[こちら](./datastructure/symbol/README.md)。
```rb
sym = :hello
puts sym      # hello
```

**ハッシュ + シンボル**
```rb
numbers = {one: :ichi, two: :ni, three: :san}

numbers.each do |key, value|
  puts "#{key} => #{value}"
end
```

[⬆︎目次に戻る](#目次)

## 制御構造

`if`, `elsif`, `else`
```rb
num = 0

if num == 0
  puts 'A'
elsif num > 0
  puts 'B'
else
  puts 'C'
end
```

`case`, `when`
```rb
score = 5

case score
when 1, 2
  puts 'Low'
when 3
  puts 'Mid'
when 4, 5
  puts 'High'
else
  puts 'Dunno'
end
```

`for`
```rb
numbers = [10, 20, 30]
for number in numbers
  puts number # 0, 1, 2, 3
end

for i in 0..3
  puts i      # 0, 1, 2, 3
end

for i in 0...3
  puts i      # 0, 1, 2
end
```

`each`
```rb
numbers = [10, 20, 30]

numbers.each do |number|
  puts number # 10, 20, 30
end
```

`while` - 条件がtrueである間、繰り返し処理を行います。
```rb
i = 0

while i < 5 do
  puts i      # 0, 1, 2, 3, 4
  i += 1
end
```

`until` - 条件がfalseである間、繰り返し処理を行います。
```rb
i = 0

until i == 5 do
  puts i      # 0, 1, 2, 3, 4
  i += 1
end
```

`times` - 指定回数繰り返し処理を行います。
```rb
3.times do |num|
  puts num    # 0, 1, 2
end
```

`upto` - 増加しながら繰り返し処理を行います。
```rb
1.upto(3) do |num|
  puts num    # 1, 2, 3
end
```

`downto` - 減少しながら繰り返し処理を行います。
```rb
5.downto(1) do |num|
  puts num    # 5, 4, 3, 2, 1
end
```

`step` - 間隔を空けながら繰り返し処理を行います。
```rb
1.step(10, 2) do |num|
  puts num    # 1, 3, 5, 7, 9
end
```

`loop` - `break`しない限り、繰り返し処理を続けます。
```rb
i = 0

loop do
  puts i
  i += 1
  if i == 5
    break
  end
end
```

`next` - 条件に一致した場合処理を飛ばします。
```rb
nums = [10, 20, 30]

nums.each do |num|
    next if num == 20
    puts num    # 10, 30
end
```

[⬆︎目次に戻る](#目次)

## 式

**条件演算子 (三項演算子)**
```rb
country = 'ja'
puts country == 'ja' ? 'こんにちは' : 'Hello'   # こんにちは
```

**代入式**
```rb
s = 'ABC'
puts x ||= s  # ABC
puts x        # ABC
```

**比較** - `equal?`や`==`, `===`などありますが、厳格な比較をする場合`eql?`を使用します。
```rb
number = 10

if number.eql?(10)
  puts 'OK'
end
```

**安全ナビゲーション演算子** - `&.`をつけることで、対象が`nil`の場合でもエラーが発生しないようにできます。
```rb
txt = nil
puts txt&.upcase    # 何もしない
puts txt.upcase     # エラー (undefined method `upcase' for nil)
```

[⬆︎目次に戻る](#目次)

## キャスト

```rb
puts 10.to_s.class            # String
puts 10.to_f.class            # Float
puts '10'.to_i.class          # Integer
puts (0..3).to_a.class        # Array
puts [[:one, 1]].to_h.class   # Hash
puts 'anne'.to_sym.class      # Symbol
```

[⬆︎目次に戻る](#目次)

## メソッド

**基本** - `return`は基本省略します。
```rb
def sum(a, b)
  a + b
end

puts sum(10, 20)  # 30
```

`undef` - メソッドを削除します。
```rb
undef sum
```

`!!` - 真偽値の型変換でtrueまたはfalseに変換します。
```rb
- def user_exists?
-   find_user ? true : false
- end

+ def user_exists?
+   !!find_user
+ end
```

`?` - 真偽値を返すメソッドには`?`をつけます。
```rb
def is_one?(number)
  !!number.eql?(1)
end

puts is_one?(1)   # true
puts is_one?(0)   # false
```

`!` - 元のオブジェクトを変更する破壊的メソッドには`!`をつけます。
```rb
name = 'anne'
name.upcase!
puts name     # ANNE
```

**特異メソッド** - 特定のオブジェクトに紐づくメソッドです。
```rb
name = 'Anne'

def name.ja
  'アン'
end

puts name     # Anne
puts name.ja  # アン
```

[⬆︎目次に戻る](#目次)

## クラス

**基本** - 以下の例には`attr_reader`(読み取り専用のインスタンス変数)、`initialize`(コンストラクタ)が含まれます。
```rb
class Human
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def introduce
    puts "My name is #{@name}"
  end
end

h = Human.new('Anne')
puts h.name   # Anne
h.introduce   # My name is Anne
```

**ネスト(1)** - クラス定義は入れ子にして定義できます。
```rb
class Human
  class Skill
  end
end
```

**ネスト(2)** - 既にクラスが定義されている場合、以下の方法でも入れ子にして定義できます。
```rb
class Human
end

class Human::Skill
end
```

**クラス定数**
```rb
class Human
  COUNTRY = 'ja'
end
```

`attr_accessor` - 外部から読み書き可能なインスタンス変数です。
```rb
class Human
  attr_accessor :age
end

h = Human.new
h.age = 20
puts h.age    # 20
```

**クラスメソッド** - クラスから直接アクセスできるメソッドです。
```rb
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.create_users(names)
    names.map { |name| User.new(name) }
  end
end

names = ['Anne', 'John', 'Paul']
users = User.create_users(names)
```

**継承**
```rb
class Human
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Japanese < Human
  attr_reader :feel_shiki
  def initialize(name, feel_shiki)
    super(name)
    @feel_shiki = feel_shiki
  end
end

jp = Japanese.new('Anne', true)
puts jp.name        # Anne
puts jp.feel_shiki  # true
```

**privateメソッド(1)** - `class << self`
```rb
class User
  class << self
    private
    def hello() puts 'Hello' end
  end
end
```

**privateメソッド(2)** - 後から可視性を変更する
```rb
class User
  def hello() puts 'Hello' end
    private :hello
end
```

**privateメソッド(3)** - private defを使用
```rb
class User
  private def hello() puts 'Hello' end
end
```

[⬆︎目次に戻る](#目次)

## モジュール

**基本** - クラスと違ってインスタンス化できません。
```rb
module Mod
  VER = 2025
end

puts Mod::VER
```

**インスタンスメソッド** - `module_function`を使用してモジュール内のメソッドを特異メソッドとして呼び出せるようになります。
```rb
module Mod
  def hello
    puts 'Hello'
  end

  module_function :hello
end

Mod.hello
```

**クラスメソッド** - `self.メソッド名`で定義したメソッドは、モジュールを`include`してもインスタンスメソッドとして使えません。
```rb
module Mod
  def self.hello
    puts 'Hello'
  end
end
```

`include` - モジュールのメソッドをインスタンスメソッドとしてクラスに組み込みます。
```rb
module Mod
  def hello() puts 'Hello' end
end

class Obj
  include Mod
end

obj = Obj.new
obj.hello
```

`extend` - モジュールのメソッドをクラスメソッドとして組み込みます。
```rb
module Mod
  def hello() puts 'Hello' end
end

class Obj
  extend Mod
end

Obj.hello
```

[⬆︎目次に戻る](#目次)

## テスト

**テストバージョンの確認** - ターミナル等から以下のコマンドで確認できます。
```sh
ruby -r minitest -e "puts Minitest::VERSION"
```

**基本**
```rb
require 'minitest/autorun'

class SampleTest < Minitest::Test
  def test_sample
    assert_equal 'RUBY', 'ruby'.upcase
  end
end
```

`assert_equal` - `assert_equal A, B`であれば、AとBが一致すればパスします。
```rb
assert_equal 'RUBY', 'ruby'.upcase
```

`assert` - `assert A`であれば、Aが真の場合パスします。
```rb
assert true
```

`refute` - `refute A`であれば、Aが偽の場合パスします。
```rb
refute false
```

[⬆︎目次に戻る](#目次)

## 例外

**注意**
- 例外処理よりも条件分岐を使う。
- 安易に`rescue`のみを使わずに、例外オブジェクト(`=> e`)を取得する。
- 例外処理の範囲、クラスは極力絞り込む。
- 予期しない条件で通った場合は異常終了させる。
- 例外処理自体もテストする。

**基本**
```rb
begin
  puts 1 / 0
rescue
  puts 'ERROR'
end
```

**例外オブジェクト** - `=> e`で例外オブジェクトを取得し、そこからエラー情報を取得できます。
```rb
begin
  puts 1 / 0
rescue => e
  p e.class     # ZeroDivisionError
  p e.message   # "divided by 0"
  p e.backtrace # (例外発生したプログラム、行番号などを出力)
end
```

**例外の限定** - `rescue 例外クラス名`で、例外を限定できます。
```rb
begin
  puts 1 / 0
rescue ZeroDivisionError => e
  puts 'Zero〜エラー'
  puts e.class
rescue TypeError => e
  puts 'Type〜エラー'
  puts e.class
end
```

**処理のやり直し** - `retry`で処理をやり直せます。 (⚠️retryは無限ループになりうるため慎重に使用しましょう。)
```rb
begin
  x = rand(2)
  puts 1 / x
rescue ZeroDivisionError => e
  puts e.class
  retry
end
```

**意図的な例外** - `raise`で意図的に例外を発生させます。
```rb
raise
raise 'エラー!'
```

**必ず実行** - `ensure`でエラーの有無に関わらず実行させるコードを定義できます。
```rb
begin
  puts 1 / 0
rescue ZeroDivisionError => e
  puts e.class
ensure
  puts 'END.'
end
```

**戻り値として扱う**
```rb
x =
  begin
    2 / 0
  rescue ZeroDivisionError => e
    -1
  end

puts x    # -1
```

**エラーの種類**
- `NameError` - 未定義の変数などが呼び出された際に発生します。
- `NoMethodError` - 存在しないメソッドが呼び出された際に発生します。
- `TypeError` - 期待しない型が引数として指定された際に発生します。
- `ArgumentError` - 引数が異なる、または期待する値でない場合に発生します。
- `ZeroDivisionError` - 0除算した際に発生します。
- `SystemStackError` - スタックが溢れた際に発生します。
- `LoadError` - requireなどが失敗した際に発生します。
- `SyntaxError` - 構文エラーです。

[⬆︎目次に戻る](#目次)

## ライブラリ

- [Stringクラスのメソッド](./library/string/README.md)
- [Integerクラスのメソッド](./library/integer/README.md)
- [Floatクラスのメソッド](./library/float/README.md)
<!--
- [Time]()
- [Date]()
- [File]()
- [Dir]()
- [FileUtils]()
- [Pathname]()
- [CSV]()
- [JSON]()
- [YAML]()
-->

[⬆︎目次に戻る](#目次)

## Extra

- [入力](./more/input/README.md)
- [正規表現](./more/regex/README.md)
- [yield・Proc](./more/yield/README.md)
- [パターンマッチ](./more/pattern/README.md)
- [未分類](./more/misc/README.md)

[⬆︎目次に戻る](#目次)

## データ構造

- [Array](./datastructure/array/README.md) - 配列
- [Set](./datastructure/set/README.md) - 重複のないオブジェクトの集合
- [ハッシュ](./datastructure/hash/README.md) - キーと値の組み合わせ
- [シンボル](./datastructure/symbol/README.md) - 速度面で有利な文字列の代用
- [配列応用](./datastructure/advanced/README.md) - 配列における応用

[⬆︎目次に戻る](#目次)

<!--
## アルゴリズム

### 探索

- [線形探索](/algo/search/linear_search.rb) - 要素を1つずつ調べる
- [二分探索](/algo/search/binary_search.rb) - ソート済みの配列で中央を基準に分割しながら探索
- [指数探索](/algo/search/exponential_search.rb) - ソート済みの配列で小さな範囲を指数的に探索し二分探索を行う
- [貪欲法 (e.g. 最小コイン問題)](/algo/search/greedy_algorithm.rb) - 局所的に最適な選択を繰り返して全体としての最適解を目指す

### グラフアルゴリズム

- [幅優先探索 (BFS)](/algo/graph/bfs.rb) - キューを使いレベルごとに探索
- [深さ優先探索 (DFS)](/algo/graph/dfs.rb) - スタックまたは再帰を使いできる限り深く探索
- [ダイクストラ法](/algo/graph/dijkstra.rb) - 単一始点の最短経路探索 (負の辺は不可)
- [ベルマンフォード法](/algo/graph/bellman_ford.rb) - 重み付きグラフで単一始点の最短経路探索
- [ワーシャル–フロイド法](/algo/graph/floyd_warshall.rb) - 全てのペアの最短経路を見つける
- [プリム法](/algo/graph/prim.rb) - 最小全域木(MST) を求める貪欲法アルゴリズム
- [クラスカル法](/algo/graph/kruskal.rb) - 最小全域木(MST) を求める
- [トポロジカルソート](/algo/topological_sort.rb) - 有向非循環グラフにおいて、ノードを線形に並べる

### ソート

- [バブルソート](/algo/sort/bubble_sort.rb) - 隣接要素を比較し、入れ替えながら徐々にソート
- [選択ソート](/algo/sort/selection_sort.rb) - 最小(または最大)値を見つけ、先頭と交換する
- [挿入ソート](/algo/sort/insertion_sort.rb) - 挿入位置を見つけ、部分的にソートされた配列に要素を挿入
- [ヒープソート](/algo/sort/heap_sort.rb) - ヒープを使い効率的にソート
- [マージソート](/algo/sort/merge_sort.rb) - 分割統治法に基づく安定ソート
- [クイックソート](/algo/sort/quick_sort.rb) - 分割統治法による高速な不安定ソート
- [シェルソート](/algo/sort/shell_sort.rb) - 増加間隔の挿入ソートによる効率化
- [カウントソート](/algo/sort/couning_sort.rb) - 数値範囲が限定された場合に有効な非比較ソート
- [基数ソート](/algo/sort/redix_sort.rb) - 整数を各桁ごとに処理する効率的な安定ソート

### 文字列

- [KMP法](/algo/string/kmp.rb) - 部分文字列を効率的に検索
- [Rabin-Karp法](/algo/string/rabin_karp.rb) - ハッシュ関数を使用した効率的な文字列検索
- [Zアルゴリズム](/algo/string/z_algorithm.rb) - パターンマッチング問題における効率的な文字列の部分一致検索
- [ハミング距離](/algo/string/hamming_distance.rb) - 2つの同じ長さの文字列の異なる位置の数を計算
- [Trie木](/algo/string/trie.rb) - 文字列を効率的に格納し検索するためのデータ構造
- [ハフマン符号化](/algo/string/huffman_coding.rb) - 貪欲法の一種で、頻度によってビット列の桁数を変える

### 数学

- [再帰 (階上値)](/algo/math/factorial.rb) - 自分自身が自分自身を呼び出す
- [モンテカルロ法](/algo/math/monte_carlo_simulation.rb) - 数値解析、シミュレーションに使用する確率・統計に基づく問題解決
- [エラトステネスの篩](/algo/math/sieve_of_eratosthenes.rb) - 素数を見つける
- [ユークリッドの互除法 (GCD)](/algo/math/gcd.rb) - 2つの整数の最大公約数を求める

### 動的計画法 (DP)

- [フィボナッチ数列](/algo/dp/fibonacci.rb) - 1から始めて前の数字を加算する
- [ナップサック問題](/algo/dp/knapsack_problem.rb) - 重さ・価値があるアイテムを、容量制限内で選んで最大価値を決める
- [最大部分配列](/algo/dp/max_subarray.rb) - 整数配列から合計が最大になる部分配列を見つける
- [最長共通部分列 (LCS)](/algo/dp/lcs.rb) - 最長共通部分列(LCS) を求める
- [最長増加部分列 (LIS)](/algo/dp/lis.rb) - 最長増加部分列(LIS) を求める

### その他

- [島の数を数える](/algo/misc/island.rb) - ?
- [ユニオンファインド](/algo/misc/union_find.rb) - 要素のグループの統合や要素が同じグループに属しているか確認する
- [活動選択問題](/algo/misc/activity_selection.rb) - 互いに重ならない活動をできるだけ多く選ぶ

</div>

-->
