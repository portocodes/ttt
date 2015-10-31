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

  def test_first_move
    assert_equal "x..\n...\n...\n", @board.move(0,0).to_s
  end

  def test_current_player
    assert_equal 'x', Ttt::Board.new.current_player
  end

  def test_current_player_after_move
    assert_equal 'o', Ttt::Board.new.move(0,0).current_player
  end

  def test_second_move
    assert_equal "xo.\n...\n...\n", Ttt::Board.new.move(0,0).move(0,1).to_s
  end
end
