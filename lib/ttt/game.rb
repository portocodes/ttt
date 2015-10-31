require 'ttt/board'
require 'ttt/board_printer'

module Ttt
  class Game
    attr_reader :board

    def initialize
      @board = Ttt::Board.new
    end

    def run
      print_board
      until board.finished?

        puts "Player #{board.current_player} [1-9]:"

        move = Ttt::Utils.position_to_coordinates(gets.chomp.to_i - 1)

        @board = board.move(move[0], move[1])

        print_board
      end

      winner = board.winner

      if winner
        puts "Player #{winner} wins!"
      else
        puts "It's a draw!"
      end
    end

    def print_board
      puts BoardPrinter.new(board)
    end
  end
end
