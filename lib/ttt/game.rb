require 'ttt/board'

module Ttt
  class Game
    attr_reader :board

    def initialize
      @board = Ttt::Board.new
    end

    def run
      puts board
      until board.finished?

        puts "Player #{board.current_player} [1-9]:"

        move = Ttt::Utils.position_to_coordinates(gets.chomp.to_i - 1)

        @board = board.move(move[0], move[1])

        puts board
      end

      winner = board.winner

      if winner
        puts "Player #{winner} wins!"
      else
        puts "It's a draw!"
      end
    end
  end
end
