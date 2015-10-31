require 'test_helper'

require 'ttt/board'

class BoardTest < Minitest::Test
  def setup
    @board = Ttt::Board.new
  end

  def winning_board
    @board.move(0,0).move(1,0).move(1,1).move(2,0).move(2,2)
  end

  def drawing_board
    @board.move(0,0).move(1,0).move(2,0).
           move(0,2).move(1,2).move(2,2).
           move(0,1).move(1,1).move(2,1)
  end

  def test_creating_board
    @board
  end

  def test_to_string
    assert_equal "...\n...\n...\n", @board.to_s
  end

  def test_first_move
    assert_equal "x..\n...\n...\n", @board.move(0,0).to_s
  end

  def test_current_player
    assert_equal 'x', @board.current_player
  end

  def test_current_player_after_move
    assert_equal 'o', @board.move(0,0).current_player
  end

  def test_current_player_after_two_moves
    assert_equal 'x', @board.move(0,0).move(1,1).current_player
  end

  def test_second_move
    assert_equal "xo.\n...\n...\n", @board.move(0,0).move(1,0).to_s
  end

  def test_winning_move
    assert_equal "xoo\n.x.\n..x\n", winning_board.to_s
  end

  def test_no_winner
    assert_equal nil, @board.winner
  end

  def test_cell_at
    board = Ttt::Board.new [[0,1,2],[3,4,5],[6,7,8]]

    9.times do |i|
      assert_equal i, board.cell_at(i)
    end
  end

  def test_first_player_wins
    assert_equal 'x', winning_board.winner
  end

  def test_move_after_game_is_finished
    assert_raises Ttt::GameOver do
      winning_board.move(0,0)
    end
  end

  def test_move_on_moved_move
    assert_raises Ttt::CellTaken do
      @board.move(0,0).move(0,0)
    end

    assert_raises Ttt::CellTaken do
      @board.move(0,2).move(0,2)
    end
  end

  def test_not_finished
    assert !@board.finished?
  end

  def test_finished_when_theres_a_winner
    assert winning_board.finished?
  end

  def test_finished_when_no_more_moves
    assert drawing_board.finished?
  end
end
