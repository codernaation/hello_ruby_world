module Adopt
  module Positions
    class Grid
      def initialize size
        if size < 2
          raise ArgumentError, "Size must be greater than 1"
        else
          @size = size
        end
        @x_collection = []
        @collection = Array.new(@size)
      end

      def fill
        (0..@size).each do |y|
          (0..@size).each do |x|
            m = Position.new(x, y)
            if ( x == 0) && ( y == 0)
              pos_to_type x, 1, m

            elsif (y == 0) && any?(x)
              pos_to_type x, 8, m

            elsif (x == @size) && ( y == 0)
              pos_to_type x, 7, m

            elsif (x == 0) && any?(y)
              pos_to_type x, 2, m

            elsif (x == @size) && any?(y)
              pos_to_type x, 6, m

            elsif (x == 0) && (y == @size)
              pos_to_type x, 3, m

            elsif any?(x) && (y == @size)
              pos_to_type x, 4, m

            elsif (x == @size) && (y == @size)
              pos_to_type x, 5, m
         
            else
              pos_to_type x, 9, m
            end
          end
          copy y, @x_collection # because
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

      def print_ocupate
        @collection.each do |y|
          y.each do |x|
            if x.ocupate?
              if x.male?
                printf("%s|", x.description)
              else
                printf("|%s", x.description)
              end
              
            else
              printf(" .")
            end
          end
          puts
        end
      end

      def print_types
        @collection.each do |y|
          y.each do |x|
            printf("%3d|", x.type)
            printf("%1d%2d", x.x_pos, x.y_pos)
          end
          puts
        end
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

