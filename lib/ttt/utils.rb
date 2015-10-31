module Ttt
  module Utils
    def self.replace input, positions, value
      if positions.empty?
        return value
      end

      input.each_with_index.map do |cell, i|
        if i == positions[0]
          replace(cell, positions[1..-1], value)
        else
          cell
        end
      end
    end
  end
end
