# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/algorithms/search/linear_search'

class LinearSearchTest < Minitest::Test
  ARR = [10, 20, 30, 40].freeze

  def test_first_element
    assert_equal 0, linear_search(ARR, 10)
  end

  def test_last_element
    assert_equal 3, linear_search(ARR, 40)
  end

  def test_not_found
    assert_equal(-1, linear_search(ARR, 41))
  end

  def test_empty_array
    assert_equal(-1, linear_search([], 10))
  end
end
