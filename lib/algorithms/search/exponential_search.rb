# frozen_string_literal: true

def binary_search(arr, left, right, target)
  while left <= right
    mid = (left + right) / 2
    return mid if arr[mid].eql?(target)

    arr[mid] < target ? left = mid + 1 : right = mid - 1
  end
  -1
end

def exponential_search(arr, target)
  n = arr.size
  return -1 if n.zero?
  return 0 if arr[0].eql?(target)

  i = 1
  i *= 2 while i < n && arr[i] <= target
  left = i / 2
  right = [i, n - 1].min
  binary_search(arr, left, right, target)
end
