# frozen_string_literal: true

def greedy_coin_change(coins, amount)
  coins.sort.reverse
  result = []
  coins.each do |coin|
    while amount >= coin
      amount -= coin
      result << coin
    end
  end
  amount.eql?(0) ? result : []
end
