# frozen_string_literal: true

def insertion_sort_with_gap(arr, gap)
  (gap...arr.size).each do |i|
    temp = arr[i]
    j = i
    while gap <= j && temp < arr[j - gap]
      arr[j] = arr[j - gap]
      j -= gap
    end
    arr[j] = temp
  end
end

def shell_sort(arr)
  gap = arr.size / 2
  while gap.positive?
    insertion_sort_with_gap(arr, gap)
    gap /= 2
  end
  arr
end
