# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../../lib/algorithms/search/greedy_coin_change'

class GreedyCoinChangeTest < Minitest::Test
  def test_exact_amount
    coins = [500, 100, 50, 10, 5, 1]
    result = greedy_coin_change(coins, 888)
    expected = [500, 100, 100, 100, 50, 10, 10, 10, 5, 1, 1, 1]
    assert_equal result, expected
  end

  def test_single_coin
    coins = [100, 50, 10]
    result = greedy_coin_change(coins, 50)
    assert_equal result, [50]
  end

  def test_no_solution
    coins = [50, 10]
    result = greedy_coin_change(coins, 16)
    assert_equal result, []
  end

  def test_zero_amount
    coins = [100, 50, 10, 5, 1]
    result = greedy_coin_change(coins, 0)
    assert_equal result, []
  end
end
