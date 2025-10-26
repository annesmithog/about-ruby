# frozen_string_literal: true

# スタートまたはゴールが見つからない場合
class MissingStartOrGoalError < StandardError; end

# BFSを使用して最短経路を見つけ、最短距離を返します。
class BfsMaze
  DIRS = [[-1, 0], [1, 0], [0, -1], [0, 1]].map(&:freeze).freeze

  def initialize(maze)
    @maze   = maze
    @height = maze.size
    @width  = maze[0].size
    @start, @goal = find_positions
    raise MissingStartOrGoalError unless @start && @goal

    @visited = Array.new(@height) { Array.new(@width, false) }
    @queue = [[*@start, 0]]
    @visited[@start[0]][@start[1]] = true
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

  def expand_neighbors(cur_y, cur_x, dist)
    DIRS.each do |dy, dx|
      ny = cur_y + dy
      nx = cur_x + dx
      next unless ny.between?(0, @height - 1) && nx.between?(0, @width - 1)
      next if @visited[ny][nx] || @maze[cur_y][cur_x] == '#'

      @visited[ny][nx] = true
      @queue << [ny, nx, dist + 1]
    end
  end

  def run
    head = 0
    while head < @queue.size
      y, x, dist = @queue[head]
      head += 1
      return dist if @goal == [y, x]

      expand_neighbors(y, x, dist)
    end
    -1
  end
end

maze = [
  '#S##.'.chars,
  '#....'.chars,
  '#.#.#'.chars,
  '#.#.G'.chars
]
p BfsMaze.new(maze).run
