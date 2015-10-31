require 'ttt/utils'

module Ttt
  class GameOver < Exception
  end

  class CellTaken < Exception
  end

  class InvalidMove < Exception
  end

  class Game
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
      raise GameOver if winner
      raise CellTaken if cell_taken?(x,y)
      raise InvalidMove if !valid_move?(x,y)

      Game.new Utils.replace(@cells, [y,x], current_player)
    end

    def cell_taken? x,y
      @cells[y][x] != '.'
    end

    def valid_move? x,y
      (0..2).include?(x) && (0..2).include?(y)
    end

    def current_player
      if @cells.flatten.count('.').odd?
        'x'
      else
        'o'
      end
    end

    def cell_at index
      x,y = Utils.position_to_coordinates(index)

      @cells[y][x]
    end

    def winner
      winning_states = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
      ]

      w = winning_states.map do |state|
        state.map { |p| cell_at p }.uniq
      end.find do |moves|
        moves.size == 1 && moves[0] != '.'
      end

      w && w.first
    end

    def finished?
      no_more_moves? || winner
    end

    def no_more_moves?
      @cells.flatten.none? { |c| c == '.' }
    end
  end
end
