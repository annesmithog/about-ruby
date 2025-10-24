# about-ruby

## 目次

- [前提](#前提)
- [変数](#変数)
- [定数](#定数)
- [ハッシュ](#ハッシュ)
- [シンボル](#シンボル)
- [配列](#配列)
- [制御構造](#制御構造)
- [式](#式)
- [キャスト](#キャスト)
- [メソッド定義](#メソッド定義)
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

**出力** - このリポジトリでは、説明のために出力を多く使用します。
```rb
print "Hello"   # 改行なし
puts "Hello"    # 改行あり
p "Hello"       # 詳細
```

**コメントアウト** - 以下の方法でコメントアウトできます。
```rb
# Comment 1

=begin
Comment 2
=end
```

**プログラム実行** - `ruby ***.rb`で実行します。
```sh
annesmithog@mba about-ruby % ruby ./sample/hello_world.rb
Hello, World!
```

**インタラクティブなRuby** - `irb`で開始、`quit`で終了します。

**RDoc** - `ri`で開始、`q`で終了します。

[⬆︎目次に戻る](#目次)

## 変数

一般的な変数です。
```rb
name = "Anne"
age = 21
```

[⬆︎目次に戻る](#目次)

## 定数

**一般的な定数**
```rb
# 再代入：可能(警告)、破壊的変更：可能
LANGUAGE1 = 'ja'
p LANGUAGE1

# 再代入：可能(警告)、破壊的変更：不可
LANGUAGE2 = 'ja'
LANGUAGE2.freeze
p LANGUAGE2

# 再代入：不可、破壊的変更：可能
module LANGUAGE3
    DEFAULT_LANG = 'ja'
end
LANGUAGE3::DEFAULT_LANG.freeze
p LANGUAGE3::DEFAULT_LANG

# 再代入：不可、破壊的変更：不可
module LANGUAGE4
    DEFAULT_LANG = 'ja'.freeze
end
LANGUAGE4.freeze
p LANGUAGE4::DEFAULT_LANG
```

**配列定数**
```rb
# 配列自体を不変にする (危険)
LANGUAGES1 = ['ja', 'en'].freeze
p LANGUAGES1[0]

# 各要素を不変にする (面倒)
LANGUAGES2 = ['ja'.freeze, 'en'.freeze]
p LANGUAGES2[0]

# mapで各要素を不変にする
LANGUAGES3 = ['ja', 'en'].map(&:freeze).freeze
p LANGUAGES3[0]
```

[⬆︎目次に戻る](#目次)

## ハッシュ

**ハッシュ** - キーと値を組み合わせて保持するデータ構造です。
```rb
numbers = {'one' => 1, 'two' => 2, 'three' => 3}
numbers.each do |key, value|
  p "#{key} => #{value}"
end
```

[⬆︎目次に戻る](#目次)

## シンボル

**シンボル** - 不変且つ同一のシンボル同士でしか比較が一致しませんが、メモリ消費が少なくパフォーマンスが高いです。
```rb
s = 'str'
p s         # "str"
p s.class   # String

sym = :sym
p sym       # :sym
p sym.class # Symbol
```

**ハッシュと一緒に使う**
```rb
numbers = {one: :ichi, two: :ni, three: :san}
numbers.each do |k, v|
  p "#{k} => #{v}"
end
```

[⬆︎目次に戻る](#目次)

## 配列

**配列**
```rb
numbers = [10, 20, 30]
numbers.each do |num|
  p num
end
```

[⬆︎目次に戻る](#目次)

## 制御構造

`if`, `elsif`, `else` - 条件分岐
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

`case`, `when` - 条件分岐
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

`for` - ループ
```rb
nums = [10, 20, 30]

# 配列を出力
for num in nums
    puts num    # 10, 20, 30
end

# 範囲を出力
for i in 0..3
    puts i      # 0, 1, 2, 3
end
```

`while` - 条件がtrueである間ループします。
```rb
i = 0

while i < 5 do
    puts i
    i += 1
end
```

`until` - 条件がfalseである間ループします。
```rb
i = 0

until i == 5 do
    puts i
    i += 1
end
```

`each` - オブジェクトを順番に処理します。
```rb
nums = {one: 1, two: 2, three: 3}

nums.each do |key, value|
    puts "#{key} -> #{value}"
end
```

`times` - x回ループ
```rb
3.times do |num|
    puts num    # 0, 1, 2
end
```

`upto` - 増加ループ
```rb
1.upto(3) do |num|
    puts num    # 1, 2, 3
end
```

`downto` - 減少ループ
```rb
5.downto(1) do |num|
    puts num    # 5, 4, 3, 2, 1
end
```

`step` - 間隔を空けるループ
```rb
1.step(10, 2) do |num|
    puts num    # 1, 3, 5, 7, 9
end
```

`loop` - breakしない限りループします。
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
puts country == 'ja' ? 'こんにちは' : 'Hello'
```

**代入式**
```rb
s = "ABC"

if (x ||= s) == "ABC"
    puts s  # ABC
end
puts x      # ABC
```

**比較**: `equal?`, `==`よりも厳格な`eql?`を使うべきです。
```rb
num = 10

if num.eql?(10)
  puts 'OK'
end
```

**安全ナビゲーション演算子** - `&.`をつけることで、対象が`nil`の場合でもエラーにしません。
```rb
txt = nil
puts txt&.upcase    # 何もしない
puts txt.upcase     # エラー (undefined method `upcase' for nil)
```

[⬆︎目次に戻る](#目次)

## キャスト

```rb
p 10.to_s                     # 文字列に変換  "10"
p 10.to_f                     # 小数に変換    10.0
p '10'.to_i                   # 整数に変換    10
p (0..3).to_a                 # 配列に変換    [0, 1, 2, 3]
p [[:one, 1], [:two, 2]].to_h # ハッシュに変換  {:one=>1, :two=>2}
p 'anne'.to_sym               # シンボルに変換  :anne
```

[⬆︎目次に戻る](#目次)

## メソッド定義

**基本** - `return`は基本省略します。
```rb
def sum(a, b)
  a + b
end

puts sum(10, 20)    # 30
```

`undef` - メソッドを削除します。
```rb
def hello
  'Hello!'
end

puts hello  # Hello!
undef hello
```

`!!` - 真偽値の型変換でtrueまたはfalseに変換します。
```rb
# def user_exists?
#   find_user ? true : false
# end

def user_exists?
  !!find_user
end
```

`?` - 真偽値を返すメソッドは`?`をつけます。
```rb
def is_zero?(num)
    num == 0 ? true : false
end
puts is_zero?(0)    # true
puts is_zero?(1)    # false
```

`!` - 破壊的メソッドは`!`をつけます。元のオブジェクトを変更します。
```rb
name = 'anne'
puts name.upcase    # ANNE
puts name           # anne
puts name.upcase!   # ANNE
puts name           # ANNE
```

**特異メソッド (例1)** - 特定のオブジェクトに紐づきます。
```rb
greet = 'Hello'

def greet.ja
  'こんにちは'
end

puts greet      # Hello
puts greet.ja   # こんにちは
```

**特異メソッド (例2)** - 特定のオブジェクトに紐づきます。
```rb
greet = 'Hello'

class << greet
  def ja
    'こんにちは'
  end
end

puts greet      # Hello
puts greet.ja   # こんにちは
```

[⬆︎目次に戻る](#目次)

## クラス

**クラス・インスタンス**
```rb
class Human
  attr_reader :name         # 読み取り専用のインスタンス変数
  attr_accessor :score      # 外部から読み書き可能なインスタンス変数
  COUNTRY = 'ja'            # クラス定数

  # コンストラクタ
  def initialize(name)
    @name = name
  end

  def output_name
    puts "Name: #{@name}"
  end

  def show_score
    puts "Score: #{@score}"
  end
end

anne = Human.new('Anne')
anne.output_name          # Name: Anne
anne.score = 90
anne.show_score           # Score: 90
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

names = ['anne', 'john', 'paul']
users = User.create_users(names)
```

**継承**
```rb
class Animal
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  attr_reader :type
  def initialize(name, type)
    super(name)
    @type = type
  end
end

animal = Animal.new('X')
dog = Dog.new('Doggo', 'Shiba')
```

**privateメソッド**
```rb
# class << self
class User1
  class << self
    private
    def hello() puts 'Hello' end
  end
end

# 後から可視性を変更する
class User2
  def hello() puts 'Hello' end
    private :hello
end

# private def... を使う
class User3
  private def hello() puts 'Hello' end
end
```

[⬆︎目次に戻る](#目次)

## モジュール

**モジュール** - モジュールはクラスと違ってインスタンス化できません。

**モジュール定数**
```rb
module Mod
  VER = 2025
end

puts Mod::VER
```

**インスタンスメソッド** - `module_function`を使用すると、モジュール内のメソッドをモジュールの特異メソッドとしても呼び出せるようになります。
```rb
module Mod
  def hello
    puts 'Hello!'
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

Mod.hello
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

**テストバージョン確認**
```sh
about-ruby % ruby -r minitest -e "puts Minitest::VERSION"
```

**基本** - `assert_equal A, B`はAとBが一致すればパス、`assert A`はAが真であればパス、`refute A`はAが偽であればパスします。
```rb
require 'minitest/autorun'

class SampleTest < Minitest::Test
  def test_sample
    assert_equal 'RUBY', 'ruby'.upcase
    assert true
    refute false
  end
end
```

[⬆︎目次に戻る](#目次)

## 例外

**注意**

- 安易に`rescue`のみを使わず、例外オブジェクト(`=> e`)を取得する。
- 例外処理の対象範囲、対象クラスは極力絞り込む。
- 例外処理よりも積極的に条件分岐を使う。
- 予期しない条件の場合は異常終了させる。
- 例外処理自体もテストする。

`begin`, `rescue` - 例外の補足をします。
```rb
begin
  puts 1 / 0
rescue
  puts 'エラー発生'
end
```

**例外オブジェクトからの情報取得** `=> e`で例外オブジェクトを取得し、そこからエラー情報を取得できます。
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
