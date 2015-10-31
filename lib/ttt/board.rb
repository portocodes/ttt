module Ttt
  class Board
    def initialize
      @cells = 3.times.map { |i| "...".split '' }
    end

    def to_s
      @cells.map { |row| row.join }.join("\n") + "\n"
    end
  end
end
