module Automatic
  module Terrains
    module Positions

      class Position
        attr_reader :x_pos, :y_pos
        
        def initialize x = 0, y = 0
          @x_pos = x
          @y_pos = y
        end

        def == position
          @x_pos == position.x_pos && @y_pos == position.y_pos
        end

        def to_a
          [@x_pos, @y_pos]
        end
      end

    end
  end
end
        