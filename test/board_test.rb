require 'test_helper'

require 'ttt/board'

class BoardTest < Minitest::Test
  def setup
    @board = Ttt::Board.new
  end

  def test_creating_board
    Ttt::Board.new
  end

  def test_to_string
    assert_equal "...\n...\n...\n", @board.to_s
  end
end
