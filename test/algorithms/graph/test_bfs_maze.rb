require 'minitest/autorun'
require_relative '../../../lib/algorithms/graph/bfs_maze'

class BfsMazeTest < Minitest::Test
  def test_start_not_exists
    maze = ['#.G'.chars]
    assert_raises(MissingStartOrGoalError) { BfsMaze.new(maze).run }
  end

  def test_goal_not_exists
    maze = ['S.#'.chars]
    assert_raises(MissingStartOrGoalError) { BfsMaze.new(maze).run }
  end

  def test_simple_maze
    maze = [
      '.###'.chars,
      'S...'.chars,
      '.##G'.chars
    ]
    assert_equal 4, BfsMaze.new(maze).run
  end

  def test_complicated_maze
    maze = [
      '.......#............'.chars,
      '....#######.....#.#.'.chars,
      '....#.....#.#####..#'.chars,
      '....#G###.#.#.......'.chars,
      '...######...#.......'.chars,
      '.........##.#....##.'.chars,
      '##................S.'.chars
    ]
    assert_equal 18, BfsMaze.new(maze).run
  end
end
