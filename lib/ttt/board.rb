require 'ttt/utils'

module Ttt
  class Board
    def initialize cells=nil
      @cells = cells || default
    end

    def default
      (3.times.map { |i| "...".split '' })
    end

    def to_s
      @cells.map { |row| row.join }.join("\n") + "\n"
    end

    def move x, y
      Board.new Utils.replace(@cells, [x,y], current_player)
    end

    def current_player
      if @cells.flatten.count('x').even?
        'x'
      else
        'o'
      end
    end
  end
end
