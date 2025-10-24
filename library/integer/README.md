# Integer

`chr` - 文字コードに対応する文字に変換
```rb
puts 65.chr   # A
```

`abs` - 絶対値
```rb
p -15.abs       # 15
```

`div` - 商
```rb
p 7.div(2)      # 3
```

`divmod` - 商と余り
```rb
p 7.divmod(2)   # [3, 1]
```

`digits` - 桁ごとの数値配列
```rb
p 1234.digits   # [4, 3, 2, 1]
```

`even?` - 偶数か
```rb
p 10.even?      # true
```

`odd?` - 奇数か
```rb
p 9.odd?        # true
```

`zero?` - 0か
```rb
p 0.zero?       # true
```

`positive?` - 0より大きいか
```rb
p 1.positive?   # true
```

`negative?` - 0より小さいか
```rb
p -1.negative?  # true
```
