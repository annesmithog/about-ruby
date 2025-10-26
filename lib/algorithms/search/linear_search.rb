# frozen_string_literal: true

def linear_search(arr, target)
  arr.each_with_index do |elem, idx|
    return idx if elem == target
  end
  -1
end
