# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/algorithms/sorting/shell_sort'

class ShellSortTest < Minitest::Test
  def test_already_sorted_array
    result = shell_sort([11, 12, 13])
    assert_equal result, [11, 12, 13]
  end

  def test_sort
    result = shell_sort([15, 14, 13, 12, 11])
    assert_equal result, [11, 12, 13, 14, 15]
  end

  def test_empty_sort
    result = shell_sort([])
    assert_equal result, []
  end

  def test_single_element_array
    result = shell_sort([123])
    assert_equal result, [123]
  end

  def test_array_with_duplicates
    result = shell_sort([13, 12, 13, 10, 9, 11, 9, 11])
    assert_equal result, [9, 9, 10, 11, 11, 12, 13, 13]
  end
end
