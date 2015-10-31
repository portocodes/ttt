module Ttt
  class BoardPrinter
    def initialize board
      @board = board
    end

    def to_s
      [
        "#{cell(1)}|#{cell(2)}|#{cell(3)}",
        "-+-+-",
        "#{cell(4)}|#{cell(5)}|#{cell(6)}",
        "-+-+-",
        "#{cell(7)}|#{cell(8)}|#{cell(9)}",
      ].join("\n")
    end

    def cell i
      case @board.cell_at(i-1)
      when '.'
        ' '
      when 'x'
        'x'
      when 'o'
        'o'
      end
    end
  end
end
