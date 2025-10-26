# frozen_string_literal: true

def binary_search(arr, target)
  left = 0
  right = arr.size - 1

  while left <= right
    mid = (left + right) / 2
    return mid if arr[mid].eql?(target)

    arr[mid] < target ? left = mid + 1 : right = mid - 1
  end
  -1
end
