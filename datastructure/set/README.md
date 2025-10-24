# Set

**作成**
```rb
require 'set'

st = Set[1, 2, 3]
st = Set['John', 'Paul']
st = Set.new([10, 20, 30])
st = [10, 20, 30].to_set
```

**追加／削除／確認**
```rb
st = Set[10, 20, 30]
p st << 40              # <Set: {10, 20, 30, 40}>
p st.add(50)            # <Set: {10, 20, 30, 40, 50}>
p st.add?(50)           # nil
p st.add(50)            # <Set: {10, 20, 30, 40, 50}>
p st.merge([60, 70])    # <Set: {10, 20, 30, 40, 50, 60, 70}>
p st.delete(70)         # <Set: {10, 20, 30, 40, 50, 60}>
p st.delete?(70)        # nil
p st.delete(70)         # <Set: {10, 20, 30, 40, 50, 60}>
p st.subtract([60, 50]) # <Set: {10, 20, 30, 40}>
p st.include?(40)       # true
```

**演算**
```rb
st1 = Set[1, 2, 3]
st2 = Set[3, 4, 5]
p st1 | st2 # <Set: {1, 2, 3, 4, 5}>
p st1 - st2 # <Set: {1, 2}>
p st1 & st2 # <Set: {3}>
p st1 ^ st2 # <Set: {4, 5, 1, 2}>
```
