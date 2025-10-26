require 'minitest/autorun'
require_relative '../../../lib/algorithms/graph/dfs_maze'

class DfsMazeTest < Minitest::Test
  def test_start_not_exists
    maze = ['#.G'.chars]
    assert_raises(MissingStartOrGoalError) { DfsMaze.new(maze).run }
  end

  def test_goal_not_exists
    maze = ['S.#'.chars]
    assert_raises(MissingStartOrGoalError) { DfsMaze.new(maze).run }
  end

  def test_simple_maze
    maze = [
      '.###'.chars,
      'S...'.chars,
      '.##G'.chars
    ]
    assert_equal 4, DfsMaze.new(maze).run
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
    assert_operator 18, :<=, DfsMaze.new(maze).run
  end
end
