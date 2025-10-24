# Array

**宣言・作成**
```rb
arr = []
arr = [10, 20, 30]                          # [10, 20, 30]
arr = [[10, 20], [30, 40]]                  # [[10, 20], [30, 40]]
arr = Array.new(3)                          # [nil, nil, nil]
arr = Array.new(3, 0)                       # [0, 0, 0]
arr = Array.new(3).map { Array.new(2, 0)}   # [[0, 0], [0, 0], [0, 0]]

arr = [10, 20, 30, 40]
p arr[0]        # 10
p arr[-1]       # 40
p arr.first     # 10
p arr.first(2)  # [10, 20]
p arr.last      # 40
p arr.last(2)   # [30, 40]
```

`delete_at(i)` - i番目の要素を削除
```rb
arr = [10, 20, 30]
arr.delete_at(0)
p arr # [20, 30]
```

`delete(n)` - nと一致する要素を削除
```rb
arr = [10, 20, 30]
arr.delete(10)
p arr # [20, 30]
```

`delete_if { ... }` - 真となる要素を削除
```rb
arr = [10, 20, 30, 40]
arr.delete_if { |x| x <= 20 }
p arr # [30, 40]
```

`map { ... }` - 配列を操作して、新しい配列を返す [!]
```rb
arr1 = [10, 20, 30]
arr2 = arr1.map! { |x| x + 1 }
p arr1  # [11, 21, 31]
p arr2  # [11, 21, 31]
```

`select { ... }` - 真になる要素を含む配列を返す [!]
```rb
arr1 = [10, 20, 30, 40]
arr2 = arr1.select! { |x| x <= 20 }
p arr1  # [10, 20]
p arr2  # [10, 20]
```

`find { ... }` - 最初に真になる要素
```rb
p [10, 20, 30].find { |x| x > 10 }  # 20
```

`all?` - 全て真か
```rb
p [10, 20, 30].all? { |x| x /= 10 }  # true
```

`any?` - いずれかが真か
```rb
p [10, 20, 30].any? { |x| x > 10 }  # true
```

`bsearch { ... }` - 二分探索を行い、値を返す
```rb
p [10, 20, 30, 40, 50].bsearch { |x| x > 10 }  # 20
```

`bsearch_index { ... }` - 二分探索を行い、インデックスを返す
```rb
p [10, 20, 30, 40, 50].bsearch_index { |x| x > 10 }  # 1
```

`sum` - 数値であれば合計値、文字であれば引数が空文字の場合文字列連結
```rb
p [10, 20, 30].sum      # 60
p ['ab', 'cd'].sum('')  # "abcd"
```

`join(s)` - 要素を文字列sで連結
```rb
p ['ab', 'cd', 'ef'].join('-') # "ab-cd-ef"
```

`values_at(i[, ...])` - i番目の値を返す
```rb
p [10, 20, 30].values_at(0, 1)   # [10, 20]
```

`sort` - ソート [!]
```rb
arr = [40, 30, 20, 50, 10]
p arr.sort  # [10, 20, 30, 40, 50]
p arr.sort!
```

`reverse` - 逆順 [!]
```rb
arr = [10, 30, 50, 20, 40]
p arr.reverse   # [40, 20, 50, 30, 10]
p arr.reverse!
```

`sort.reverse` - 逆順ソート
```rb
arr = [10, 30, 50, 20, 40]
p arr.sort.reverse    # [50, 40, 30, 20, 10]
p arr.sort!.reverse!
```

`push`, `pop` 末尾に追加／削除<br>
`unshift`, `shift` - 先頭に追加／削除
```rb
arr = [10, 20, 30]

p arr             # [10, 20, 30]
p arr.push(40)    # [10, 20, 30, 40]
p arr.pop         # 40
p arr             # [10, 20, 30]
p arr.unshift(5)  # [5, 10, 20, 30]
p arr.shift       # 5
p arr             # [10, 20, 30]
```

`compact` - nilを取り除く [!]
```rb
arr = [10, nil, 30]
p arr.compact   # [10, 30]
p arr.compact!
```

`uniq` - 重複値を取り除く [!]
```rb
arr = [10, 10, 20, 30, 30]
p arr.uniq   # [10, 20, 30]
p arr.uniq!
```

`concat(other_array)` - 他の配列other_arrayと連結
```rb
p [10, 20, 30].concat([40, 50])   # [10, 20, 30, 40, 50]
```

`count` - 要素数
```rb
p [10, 20, 30, 30].count          # 4
```

`count(elem)` - 値elemと一致した要素数
```rb
p [10, 20, 30, 30].count(30)      # 2
```

`min` - 最小値<br>
`max` - 最大値<br>
`minmax` - 最小値、最大値の配列
```rb
p [11, 12, 13].min    # 11
p [11, 12, 13].max    # 13
p [11, 12, 13].minmax # [11, 13]
```

`permutation.to_a` - 順列
```rb
arr = [1, 2, 3]
p arr.permutation.to_a  # [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
```

`combination(n).to_a` - 組み合わせ (n=各要素の要素数)
```rb
arr = [1, 2, 3]
p arr.combination(1).to_a # [[1], [2], [3]]
p arr.combination(2).to_a # [[1, 2], [1, 3], [2, 3]]
p arr.combination(3).to_a # [[1, 2, 3]]
```
