# frozen_string_literal: true

def quick_sort(arr)
  return arr if arr.size <= 1

  pivot = arr[arr.size / 2]
  left  = arr.select { |x| x <  pivot }
  mid   = arr.select { |x| x == pivot }
  right = arr.select { |x| x >  pivot }
  quick_sort(left) + mid + quick_sort(right)
end
