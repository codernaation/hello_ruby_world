module Automatic
  module Terrains
    module Cells

      class Cell < Terrains::Positions::Position
        
        include Directions
        include Occupations

        attr_accessor :ways_to_move, :occupator

        def initialize type, position       
          @occupator = nil
          set_directions type
          super position.x_pos, position.y_pos
        end      

      end

    end
  end
end
