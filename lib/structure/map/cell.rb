module Adopt
  module Positions
    WAYS = ['N','NE','E','SE','S','SW','W','NW']
    CELL_TYPES = {
      1 => ['E','SE','S'],
      2 => ['N','NE','E','SE','S'],
      3 => ['N','NE','E'],
      4 => ['W','NW','N','NE','E'],
      5 => ['W','NW','N'],
      6 => ['S','SW','W','NW','N'],
      7 => ['S','SW','W'],
      8 => ['E','SE','S','SW','W'],
      9 => ['N','NE','E','SE','S','SW','W','NW']
    }

    class Position
      attr_accessor :x_pos, :y_pos
      def initialize x = 0, y = 0
        @x_pos = x
        @y_pos = y
      end

      def to_a
        [@x_pos,@y_pos]
      end
    end

    class Cell < Position
      include Adopt::DirectionDecoder
      attr_accessor :ways_to_move, :type, :cell_ocupator

      def initialize type
        @ocupate = false
        @cell_ocupator = nil
        @type = type
        @ways_to_move = CELL_TYPES[@type]
        super 0, 0
      end

      def ocupate?
        @ocupate
      end

      def bind_unit unit
        begin
          @cell_ocupator = unit if unit.instance_of? Adopt::Units::Unit
          @ocupate = true
        rescue #ArgumentTypeError
          'Expected Adopt::UnitBuilder in 1st argument'
        end
      end

      def unbind_unit
        @ocupate = false
        @cell_ocupator = nil
      end

      def unit_transfer other_cell
        unit = @cell_ocupator
        unbind_unit
        other_cell.bind_unit unit
      end

      def update_position pos
        @x_pos = pos.x_pos
        @y_pos = pos.y_pos
        self
      end

      def position? pos
        (@x_pos == pos.x_pos) && (@y_pos == pos.y_pos)
      end

      def random_direction 
        @ways_to_move[rand(ways_to_move.size)]
      end

      def move grid_get_method
        unit_transfer ways2cells(grid_get_method).first
      end

      private

      def ways2cells grid_get_method
        potential_new_cells = []
        @ways_to_move.each do |way|
          position = way2pos way
          potential_cell = grid_get_method.call(position['x'], position['y']) 
          unless potential_cell.ocupate?
            potential_new_cells << potential_cell
          end
        end
        puts potential_new_cells
        potential_new_cells
      end
    end
  end
end
