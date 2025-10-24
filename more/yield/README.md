# yield・Proc

## yield

`yield` - ブロックをメソッド内部で呼び出す際に使用します。
```rb
def calling
  puts 1
  yield
  puts 3
end

calling do
  puts 1.5
  puts 2
  puts 2.5
end

=begin
1
1.5
2
2.5
3
=end
```

## Proc

**基本** - `Proc`はブロックをオブジェクト化するクラスです。
```rb
hello_proc = Proc.new do
  'Hello!'
end
puts hello_proc.call        # Hello!
```

**省略形** - `do`, `end`をそれぞれ`{`, `}`に置き換えることで省略できます。
```rb
hello_proc = Proc.new { 'Hello!' }
puts hello_proc.call        # Hello!
```

**引数ありの場合**
```rb
sum_proc = Proc.new { |a, b| a + b }
puts sum_proc.call(1, 2)      # 3
```

**Karnelモジュールのprocを使う** - `Proc.new`を`proc`に省略できます。
```rb
sum_proc = proc { |a, b| a + b }
puts sum_proc.call(1, 2)      # 3
```

**`->`構文を使う** - さらに省略できます。呼び出しは基本と同様です。
```rb
hello_proc = -> { 'Hello!' }
sum_proc = -> (a, b) { a + b }
```

**lambdaメソッド** - lambdaを使用して基本系より省略できます。呼び出しは基本と同様です。
```rb
hello_proc = lambda { 'Hello!' }
sum_proc = -> lambda { |a, b| a + b}
```

**Procオブジェクトをブロックとして渡す場合** - `&`を使用します。
```rb
reverse_proc = Proc.new { |s| s.reverse }
puts ['Ruby', 'CPP'].map(&reverse_proc)     # ybuR, PPC
```
