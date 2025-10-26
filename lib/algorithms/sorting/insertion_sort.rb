# frozen_string_literal: true

def insertion_sort(arr)
  (1...arr.size).each do |i|
    current_value = arr[i]
    j = i - 1
    while j >= 0 && current_value < arr[j]
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = current_value
  end
  arr
end
