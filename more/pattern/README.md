# パターンマッチ

## 1行パターンマッチ

```rb
if [1, 2, 3] in [Integer, Integer, Integer]
  puts 'OK'
else
  puts 'NG'
end
```

## 配列

```rb
require 'date'

release_dates = [
  [1996],         # 1996-01-01
  [2004, 5],      # 2004-05-01
  [2025, 10, 25]  # 2025-10-25
]

release_dates.map do |release_date|
x =
  case release_date
  in [y]
    Date.new(y, 1, 1)
  in [y, m]
    Date.new(y, m, 1)
  in [y, m, d]
    Date.new(y, m, d)
  end
puts x
end
```

## ハッシュ

```rb
artists = [
  {name: 'The Beatles', rank: '1st'},               # The Beatles (1st)
  {name: 'Bruno Mars', rank: '2nd', type: 'solo'},  # Bruno Mars (2nd) [solo]
  {name: 'Daniel Ceaser', type: 'solo'}             # Daniel Ceaser [solo]
]

artists.each do |artist|
  case artist
  in {name:, rank:, type:}
    puts "#{name} (#{rank}) [#{type}]"
  in {name:, rank:}
    puts "#{name} (#{rank})"
  in {name:, type:}
    puts "#{name} [#{type}]"
  end
end
```

## valueパターン

- in節に数値や文字列などを直接指定できる利用パターン
- パターンがマッチしない場合、エラーになる

```rb
country = 'japan'

message =
  case country
  in 'japan'
    'こんにちは'
  in 'usa'
    'Hello'
  end

puts message
```

## variableパターン

- in節に変数を書き、ローカル変数の宣言と代入を同時に行う利用パターン

**基本**
```rb
case 'Alice'
in obj
  "obj=#{obj}"
end

puts obj
```

**事前に定義した変数を使う場合 (厳密に言うとvalueパターン)**
```rb
alice = 'Alice'
bob = 'Bob'

name = 'Bob'

case name
in ^alice
  puts 'Hello, Alice'
in ^bob
  puts 'Hello, Bob'
end
```

## arrayパターン

- in節に`[]`を使って配列の構造パターンを指定する利用パターン

**基本**
```rb
case [10, 20, 30]
in [a]
  "a=#{a}"
in [a, b]
  "a=#{a}, b=#{b}"
in [a, b, c]
  "a=#{a}, b=#{b}, c=#{c}"
end

puts a  # 10
puts b  # 20
puts c  # 30
```

**数値や文字列をそのまま指定すると、「その値と等しいこと」が条件になる**
```rb
case [1, 999, 3]
in [1, n, 3]
  "n=#{n}"
end

puts n  # 999
```

## hashパターン

- in節に`{}`を使ってハッシュの構造パターンを指定する利用パターン

**基本**
```rb
case {name: 'Alice', age: 20}
in {name: name, age: age}
  "name=#{name}, age=#{age}"
end

puts name # Alice
puts age  # 20
```

**省略** - in節の値は省略可能です。
```rb
case {name: 'Alice', age: 20}
in {name:, age:}
  "name=#{name}, age=#{age}"
end

puts name # Alice
puts age  # 20
```

## asパターン

- マッチしたオブジェクトを変数に代入する利用パターン

```rb
case {name: 'Alice', age: 20, gender: :female}
in {name: String => name, age: 18.. => age}
  "name=#{name}, age=#{age}"
end

puts name # Alice
puts age  # 20
```

## alternativeパターン

- 2つ以上のパターンを指定し、どれか1つのマッチでマッチしたとみなす利用パターン

```rb
case [2021, 4, 1]
in [Integer, Integer, Integer] | Date => obj
  "obj=#{obj}"
end

p obj # [2021, 4, 1]
```

## findパターン

```rb
# 10以上の整数が3つ連続する部分を探す
case [13, 11, 9, 6, 12, 10, 15, 5, 7, 14]
in [*, 10.. => a, 10.. => b, 10.. => c, *]
  "a=#{a}, b=#{b}, c=#{c}"  # "a=12, b=10, c=15"
end
```
