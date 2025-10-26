# frozen_string_literal: true

def merge_elements(l_arr, r_arr, sorted_arr, l_idx, r_idx)
  while l_idx < l_arr.size && r_idx < r_arr.size
    if l_arr[l_idx] <= r_arr[r_idx]
      sorted_arr << l_arr[l_idx]
      l_idx += 1
    else
      sorted_arr << r_arr[r_idx]
      r_idx += 1
    end
  end
  [l_idx, r_idx]
end

def merge(l_arr, r_arr)
  sorted_arr = []
  l_idx, r_idx = merge_elements(l_arr, r_arr, sorted_arr, 0, 0)
  sorted_arr.concat(l_arr[l_idx..]) if l_idx < l_arr.size
  sorted_arr.concat(r_arr[r_idx..]) if r_idx < r_arr.size
  sorted_arr
end

def merge_sort(arr)
  arr_size = arr.size
  return arr if arr_size <= 1

  mid = arr_size / 2
  l_half = merge_sort(arr[0...mid])
  r_half = merge_sort(arr[mid...arr_size])
  merge(l_half, r_half)
end
