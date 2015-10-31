require 'ttt/board'
require 'ttt/board_printer'

module Ttt
  class Game
    attr_reader :board

    def initialize
      @board = Ttt::Board.new
    end

    def run
      until board.finished?
        print_board

        move = prompt_move

        make_move move
      end

      print_board
      print_result
    end

    def prompt_move
      puts "Player #{board.current_player} [1-9]:"

      Ttt::Utils.position_to_coordinates(gets.chomp.to_i - 1)
    end

    def make_move move
      @board = board.move move[0], move[1]
    end

    def print_board
      puts BoardPrinter.new(board)
    end

    def print_result
      winner = board.winner

      if winner
        puts "Player #{winner} wins!"
      else
        puts "It's a draw!"
      end
    end
  end
end
