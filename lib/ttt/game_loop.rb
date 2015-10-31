require 'ttt/game'
require 'ttt/board_printer'

module Ttt
  class GameLoop
    attr_reader :game

    def initialize
      @game = Ttt::Game.new
    end

    def run
      until game.finished?
        print_game

        move = prompt_move

        begin
          make_move move
        rescue
          puts "Invalid move! Try again."
        end
      end

      print_game
      print_result
    end

    def prompt_move
      puts "Player #{game.current_player} [1-9]:"

      Ttt::Utils.position_to_coordinates(gets.chomp.to_i - 1)
    end

    def make_move move
      @game = game.move move[0], move[1]
    end

    def print_game
      puts BoardPrinter.new(game)
    end

    def print_result
      winner = game.winner

      if winner
        puts "Player #{winner} wins!"
      else
        puts "It's a draw!"
      end
    end
  end
end
