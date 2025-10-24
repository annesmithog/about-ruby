# String

`upcase` - 大文字に変換 [!]
```rb
puts 'hello'.upcase   # HELLO
puts 'hello'.upcase!
```

`downcase` - 小文字に変換 [!]
```rb
puts 'HELLO'.downcase   # hello
puts 'HELLO'.downcase!
```

`capitalize` - タイトルケースに変換 [!]
```rb
puts 'anne'.capitalize   # Anne
puts 'anne'.capitalize!
```

`swapcase` - 小文字を大文字、大文字を小文字に変換 [!]
```rb
puts 'Hello'.swapcase   # hELLO
puts 'Hello'.swapcase!
```

`reverse` - 逆順 [!]
```rb
puts 'abc'.reverse  # cba
puts 'abc'.reverse!
```

`concat` - 引数の文字を繋げる
```rb
puts '123'.concat('45', '67') # 1234567
```

`center` - 中央寄せ
```rb
p 'anne'.center(10)       # "   anne   "
p 'anne'.center(10, '*')  # "***anne***"
```

`ljust` - 左寄せ
```rb
p 'anne'.ljust(10)        # "anne      "
p 'anne'.ljust(10, '*')   # "anne******"
```

`rjust` - 右寄せ
```rb
p 'anne'.rjust(10)        # "      anne"
p 'anne'.rjust(10, '*')   # "******anne"
```

`chomp` - 改行コードを削除 [!]

`chop` - 改行コードを削除、存在しない場合最後の文字を削除 [!]

`strip` - スペースを削除 [!]
```rb
p ' hello '.strip   # "hello"
p ' hello '.strip!
```

`lstrip` - 左側のスペースを削除 [!]
```rb
p ' hello '.lstrip    # "hello "
p ' hello '.lstrip!
```

`rstrip` - 右側のスペースを削除 [!]
```rb
p ' hello '.rstrip    # " hello"
p ' hello '.rstrip!
```

`insert` - 文字列を挿入
```rb
p 'hello'.insert(4, ', n')   # hell, no
```

`succ` - 次の文字に変換 (例 `A` => `B`) [!]
```rb
p 'ABB'.succ    # "ABC"
p 'ABB'.succ!
```

`delete` - 引数が文字列に含まれる場合削除 [!]
```rb
p 'hello'.delete('lo')  # he
p 'hello'.delete!('lo')
```

`delete_prefix` - 引数の文字列から始まる場合、該当部分を削除 [!]
```rb
p 'hello'.delete_prefix('he')   # llo
p 'hello'.delete_prefix!('he')
```

`delete_suffix` - 引数の文字で終わる場合、該当部分を削除 [!]
```rb
p 'hello'.delete_suffix('lo')   # hel
p 'hello'.delete_suffix!('lo')
```

`size` - 文字列の長さ
```rb
p 'hello'.size  # 5
```

`count` - 要素数
```rb
p 'hello'.count('o')  # 1
```

`index` - 最初に一致したインデックス
```rb
p 'hello'.index('l')  # 2
```

`rindex` - `index`を右から実行し、最初に一致したインデックス
```rb
p 'hello'.rindex('l') # 3
```

`ord` - 文字コードを取得
```rb
p 'A'.ord           # 65
```

`chars` - 文字ごとの配列
```rb
p 'ABC'.chars       # ["A", "B", "C"]
```

`codepoints` - 文字ごとの文字コード配列
```rb
p 'ABC'.codepoints  # [65, 66, 67]
```

`empty?` - 空かどうか
```rb
p ''.empty?         # true
```

`start_with?` - 文字列が指定文字列で始まるか
```rb
p 'Hello'.start_with?('H')  # true
```

`end_with?` - 文字列が指定文字列で終わるか
```rb
p 'Hello'.end_with?('o')    # true
```

`include?` - 文字列が指定文字列を含むか
```rb
p 'Hello'.include?('e')     # true
```

`tr` - 引数1を引数2に変換する (正規表現可) [!]
```rb
p 'ACDC'.tr('C', 'E')   # "AEDE"
p 'ACDC'.tr!('C', 'E')

p 'hello'.tr('a-z', 'A-Z')  # HELLO
```

`tr_s` - `tr`の処理 + 同一文字は１文字に圧縮する [!]
```rb
p 'hello'.tr_s('l', 'x')  # hexo
p 'hello'.tr_s!('l', 'x')
```

**置換**
```rb
s = 'Anne'
s[0..1] = 'Fu'
p s   # "Fune"
```

**各文字に対して処理**
```rb
s = 'abc'
s.each_char do |c|
  p c
end
```

**各文字のコードポイントに対して処理**
```rb
s = 'abc'
s.each_codepoint do |cp|
  p cp
end
```
