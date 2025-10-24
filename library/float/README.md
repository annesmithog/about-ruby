# Float

`floor` - 切り捨て
```rb
p 1.1.floor   # 1
p 2.0.floor   # 2
p 1.123.floor(1)  # 1.1
p 1.123.floor(2)  # 1.12
```

`ceil` - 切り上げ
```rb
p 1.1.ceil      # 2
p 2.0.ceil      # 2
p 1.123.ceil(1) # 1.2
p 1.123.ceil(2) # 1.13
```

`round` - 四捨五入
```rb
p 1.1.round       # 1
p 1.5.round       # 2
p 1.123.round(1)  # 1.1
p 1.125.round(2)  # 1.13
```

`zero?` - 0か
```rb
p 0.0.zero? # true
```
