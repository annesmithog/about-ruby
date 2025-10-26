# frozen_string_literal: true

def get_digits_at_position(num, pos)
  (num / pos) % 10
end

def update_count(arr, arr_size, exp, cnt)
  arr_size.times do |i|
    cnt[get_digits_at_position(arr[i], exp)] += 1
  end

  (1..9).each do |i|
    cnt[i] += cnt[i - 1]
  end
end

def update_output(arr, arr_size, exp, output, cnt)
  (arr_size - 1).downto(0) do |i|
    idx = get_digits_at_position(arr[i], exp)
    output[cnt[idx] - 1] = arr[i]
    cnt[idx] -= 1
  end
end

def counting_sort(arr, exp)
  arr_size = arr.size
  output = Array.new(arr_size, 0)
  cnt = Array.new(10, 0)
  update_count(arr, arr_size, exp, cnt)
  update_output(arr, arr_size, exp, output, cnt)
  arr_size.times { |i| arr[i] = output[i] }
end

def radix_sort(arr)
  return arr if arr.size <= 1

  arr_max = arr.max
  exp = 1
  while (arr_max / exp).positive?
    counting_sort(arr, exp)
    exp *= 10
  end
  arr
end
