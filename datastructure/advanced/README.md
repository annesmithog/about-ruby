# 配列応用

## ループ

**`each` 基本**
```rb
arr = [10, 20, 30]

arr.each do |x|
  puts x
end
```

**do...endの代用**
```rb
arr.each { |x| puts x }
```

`each_with_index` - 添字付き
```rb
arr.each_with_index { |x, idx| puts "#{idx} => #{x}" }
```

`each.with_index(n)` - nから添字を開始
```rb
arr.each.with_index(1) { |x, i| puts "#{i} => #{x}" }
```

`n.times` - n回繰り返す (0〜4)
```rb
5.times { |i| puts i }
```

`n.upto(m)` - n〜mまで繰り返す (1〜5)
```rb
1.upto(5) { |i| puts i }
```

`m.downto(n)` - m〜nまで繰り返す (5〜1)
```rb
5.downto(1) { |i| puts i }
```

`n.step(m, steps)` - n〜m間を間隔stepsで繰り返す (1, 3, 5, 7, 9)
```rb
1.step(10, 2) { |i| puts i }
```

**`while` 基本**
```rb
arr = [10, 20, 30]

while arr.size < 5
  arr << 0
end
```

**`while` 省略**
```rb
arr << 0 while arr.size < 5
```

`until` - 一致しない間繰り返す
```rb
until arr.size == 5
  arr << 0
end
```

`for` - 繰り返し。for内で宣言した変数は外でも使用可能
```rb
for x in arr do
  puts x
  y = x + 1
end
puts y
```

`loop` - breakまで無限ループ
```rb
i = 0
loop do
  puts arr[i]
  i += 1
  break if i.eql?(arr.size)
end
```

`redo` - 繰り返し処理をやり直す
```rb
arr.each do |x|
  puts "You like #{x}?"
  answer = ['Y', 'N'].sample
  puts answer
  redo unless answer.eql?('Y')
end
```

`map`を簡潔に書く
```rb
arr = ['John', 'Paul']
# p arr.map { |x| x.upcase }
p arr.map(&:upcase)   # ["JOHN", "PAUL"]
```

`select`を簡潔に書く
```rb
arr = [1, 2, 3, 4, 5]
# p arr.select { |n| n.odd? }
p arr.select(&:odd?)  # [1, 3, 5]
```
