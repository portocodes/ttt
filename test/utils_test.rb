require 'test_helper'

require 'ttt/utils'

class UtilsTest < Minitest::Test
  def test_single_level_replace
    assert_equal [1,2,8,4,5], Ttt::Utils.replace([1,2,3,4,5], [2], 8)
  end

  def test_two_levels_replace
    input = [
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ]

    expected = [
      [1,2,3],
      [4,5,0],
      [7,8,9]
    ]

    assert_equal expected, Ttt::Utils.replace(input, [1,2], 0)
  end

  def test_chained_replacements
    input = [
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ]

    expected = [
      [0,2,3],
      [4,5,0],
      [7,0,9]
    ]

    actual = Ttt::Utils.replace(
      Ttt::Utils.replace(
        Ttt::Utils.replace(input, [0,0], 0),
        [1,2], 0),
      [2,1], 0)

    assert_equal expected, actual
  end
end
