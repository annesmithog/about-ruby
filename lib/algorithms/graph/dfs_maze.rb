# frozen_string_literal: true

# スタートまたはゴールが見つからない場合
class MissingStartOrGoalError < StandardError; end

# DFSを使用して到達可能な経路を見つけ、その距離を返します。
class DfsMaze
  DIRS = [[-1, 0], [1, 0], [0, -1], [0, 1]].map(&:freeze).freeze

  def initialize(maze)
    @maze   = maze
    @height = maze.size
    @width  = maze[0].size
    @start, @goal = find_positions
    raise MissingStartOrGoalError unless @start && @goal

    @visited = Array.new(@height) { Array.new(@width, false) }
  end

  def find_positions
    start, goal = nil
    @maze.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        start = [y, x] if cell == 'S'
        goal  = [y, x] if cell == 'G'
      end
    end
    [start, goal]
  end

  def run
    dfs(@start[0], @start[1], 0) || -1
  end

  def dfs(cur_y, cur_x, dist)
    return dist if @goal == [cur_y, cur_x]
    return nil if @visited[cur_y][cur_x] || @maze[cur_y][cur_x] == '#'

    @visited[cur_y][cur_x] = true
    DIRS.each do |dy, dx|
      ny = cur_y + dy
      nx = cur_x + dx
      next if ny.negative? || ny >= @height || nx.negative? || nx >= @width

      result = dfs(ny, nx, dist + 1)
      return result if result
    end
    @visited[cur_y][cur_x] = false
  end
end

maze = [
  '#S##.'.chars,
  '#....'.chars,
  '#.#.#'.chars,
  '#.#.G'.chars
]
p DfsMaze.new(maze).run
