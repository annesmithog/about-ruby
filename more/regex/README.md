# 正規表現

`scan`
```rb
txt = <<TEXT
  I love Ruby.
  Python, not bad.
  JavaScript is shit.
TEXT

languages = txt.scan(/[A-Z][A-Za-z]+/)
languages.each do |lang|
  p lang
end

# "Ruby"
# "Python"
# "JavaScript"
```

`gsub` - 引数1にマッチした文字列を引数2の文字列で置換します。
```rb
txt = <<TEXT
郵便番号は1234567。
TEXT

p txt.gsub(/(\d{3})(\d{4})/) { "#{$1}-#{$2}" }

# "郵便番号は123-4567。\n"
```

**比較演算子** - `=~`は一致, `!~`は不一致の場合真とします。
```rb
code = '123-4567'

puts code =~ /\d{3}-\d{4}/ ? 'OK' : 'NG'  # OK
puts code =~ /\d{3}-\d{5}/ ? 'OK' : 'NG'  # NG
puts code !~ /\d{3}-\d{4}/ ? 'OK' : 'NG'  # NG
puts code !~ /\d{3}-\d{5}/ ? 'OK' : 'NG'  # OK
```

**Regexpクラス** - 正規表現系として扱えます。
```rb
r = /\d{3}-\d{4}/
puts r.class      # Regexp
```

**キャプチャ (基本)**
```rb
birth = 'BIRTHDAY: 2004-12-31'
br = /(\d+)-(\d+)-(\d+)/
bd_match = br.match(birth)
puts bd_match[0]      # 2004-12-31
puts bd_match[1]      # 2004
puts bd_match[2]      # 12
puts bd_match[3]      # 31
```

**キャプチャ (名前をつける)**
```rb
birth = 'BIRTHDAY: 2004-12-31'
br = /(?<y>\d+)-(?<m>\d+)-(?<d>\d+)/
bd_match = br.match(birth)
puts bd_match         # 2004-12-31
puts bd_match[:y]     # 2004
puts bd_match[:m]     # 12
puts bd_match[:d]     # 31
```

**比較演算子でキャプチャ**
```rb
birth = 'BIRTHDAY: 2004-12-31'
birth =~ /(\d+)-(\d+)-(\d+)/
puts $1         # 2004
puts $2         # 12
puts $3         # 31
```

`slice`, `slice!` - 文字列から正規表現にマッチした部分を抜き出します。

`split` - マッチした文字列を区切り文字にして分解し、配列として返します。
