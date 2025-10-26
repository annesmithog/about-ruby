# frozen_string_literal: true

def bubble_sort(arr)
  n = arr.size

  loop do
    swapped = (n - 1).times.any? do |i|
      arr[i], arr[i + 1] = arr[i + 1], arr[i] if arr[i] > arr[i + 1]
    end
    break unless swapped
  end
  arr
end
