# 入力

```rb
s = gets        # 文字列
s = gets.chomp  # 改行コードを除いた文字列
n = gets.to_i   # 数値
nums = gets.chomp.split.map(&:to_i)               # スペース区切り + 数値化
nums = gets.chomp.split(',').map(&:to_i)          # カンマ区切り + 数値化
strs = gets.chomp.split('')                       # 文字列を配列化
fields = Array.new(5) { gets.split.map(&:to_i) }  # 二次元配列で受け取る
```
