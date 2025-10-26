# frozen_string_literal: true

def counting_sort(arr)
  return arr if arr.empty?

  max_value = arr.max
  cnt = Array.new(max_value + 1, 0)
  arr.each { |i| cnt[i] += 1 }
  sorted_arr = []
  cnt.each_with_index { |frequency, i| frequency.times { sorted_arr << i } }
  sorted_arr
end
