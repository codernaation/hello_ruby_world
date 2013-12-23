module Automatic
  module Terrains
    module Grids
      module GridBuilder
    
        def build
          @collection = []
          @temp_collection = []
          (0..@size).each do |y|
            (0..@size).each do |x|
              position = Terrains::Positions::Position.new(x, y)
              @temp_collection[x] = Terrains::Cells::Cell.new(detect_type(x, y), position)
            end
            @collection[y] = @temp_collection.dup 
          end
          @temp_collection.clear
        end
        
        private

        def any? num
          (1...@size).include? num
        end  

        def detect_type x, y
          if ( x == 0) && ( y == 0)
            1
          elsif (y == 0) && any?(x)
            8
          elsif (x == @size) && ( y == 0)
            7
          elsif (x == 0) && any?(y)
            2
          elsif (x == @size) && any?(y)
            6
          elsif (x == 0) && (y == @size)
            3
          elsif any?(x) && (y == @size)
            4
          elsif (x == @size) && (y == @size)
            5       
          else
            9
          end
        end

      end
    end
  end
end