# シンボル

**特徴**

- 文字列の代用だが、必ず文字列と同じ振る舞いをするわけではない
- 不変
- 内容的には整数で、文字列より高速な上にメモリ使用効率が高い
- ハッシュのキーとして使用可能

**作成**
```rb
p :apple
```

**比較**
```rb
x = :apple

p :apple == 'apple'         # false
p :apple.equal?('apple')    # false
p :apple.eql?('apple')      # false
p :apple == x               # true
p :apple.equal?(x)          # true
p :apple.eql?(x)            # true
```

`:$*****` - **グローバル変数**
```rb
x = :$grape
p x     # :$grape
puts x  # $grape
```

`:@*****` - **インスタンス変数**
```rb
x = :@orange
p x     # :@orange
puts x  # @orange
```
