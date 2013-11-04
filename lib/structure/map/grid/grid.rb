module Adopt
  module Positions
    class Grid
      include Adopt::ConsoleOutput
      include Adopt::HTMLOutput
      include Adopt::GridInit

      def initialize shared
        if shared[:size] < 2
          raise ArgumentError, "Size must be greater than 1"
        else
          @size = shared[:size]
          shared.delete :size
        end
        @x_collection = []
        @collection = []
        @render_file = File.new('show.html', 'w')
        write_header
        shared.each do |name, body|
          Cell.send(:define_method, name, &body)
        end
      end     

      def random_binding units
        units.each do |x|
          @x_collection = not_ocupated_cells
          @x_collection[rand(@x_collection.size)].bind_unit x
        end
      end

      def get_cell_by_type
        raise "not implemented"
      end

      def get_cell_by_ocupate flag
        if flag
          ocupated_cells
        else
          not_ocupated_cells
        end
      end

      def get_cell_by_position x, y
        @collection[y][x]
      end      

      private

      def pos_to_type x, t, m
        @x_collection[x] = Cell.new(t).update_position(m)
      end

      def copy y, arr
        @collection[y] = arr.select { |cell| (cell.type > 0) && (cell.type < 10)}
      end

      def any? num
        (1...@size).include? num
      end

      def ocupated_cells 
        @collection.flatten.select { |x| x.ocupate? }
      end

      def not_ocupated_cells 
        @collection.flatten.select { |x| !x.ocupate? }
      end
    end
  end
end

