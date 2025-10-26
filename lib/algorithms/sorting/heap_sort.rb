# frozen_string_literal: true

def find_largest(arr, arr_size, index, left, right)
  largest = index
  largest = left if left < arr_size && arr[largest] < arr[left]
  largest = right if right < arr_size && arr[largest] < arr[right]
  largest
end

def heapify(arr, arr_size, index)
  left = 2 * index + 1
  right = 2 * index + 2
  largest = find_largest(arr, arr_size, index, left, right)
  return unless largest != index

  arr[index], arr[largest] = arr[largest], arr[index]
  heapify(arr, arr_size, largest)
end

def heap_sort(arr)
  n = arr.size
  (n / 2 - 1).downto(0) { |i| heapify(arr, n, i) }
  (n - 1).downto(1) do |i|
    arr[0], arr[i] = arr[i], arr[0]
    heapify(arr, i, 0)
  end
  arr
end
