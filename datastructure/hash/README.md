# ハッシュ

**作成**
```rb
h = {}
h = {'japan' => 'ja', 'usa' => 'en'}
h = {:japan => 'ja', :usa => 'en'}    # 高速
h = {japan: :ja, usa: :en}            # 短い
```

**追加／削除**
```rb
h = {japan: :ja, usa: :en}
h[:china] = :ch       # 追加
h.delete(:china)      # 削除
```

`size` - 要素数
```rb
p h.size  # 2
```

`keys` - キー一覧
```rb
p h.keys    # [:japan, :usa]
```

`values` - 値一覧
```rb
p h.values    # [:ja, :en]
```

`include?` - キーが存在するか
```rb
p h.include?(:japan)  # true
```

`merge` - 展開、要素追加した新しいハッシュを返す
```rb
new_h = {**h, china: :ch}
p new_h   # {:japan=>:ja, :usa=>:en, :china=>:ch}
```

`each` - 繰り返し
```rb
h.each do |k, v|
  puts "#{k} => #{v}"
end
```

**各要素をキーワード引数として渡す**
```rb
def details(**h)
  h.each { |k, v| puts "#{k} => #{v}" }
end

details(**h)
```
