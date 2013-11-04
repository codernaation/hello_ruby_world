module Adopt
  module GridInit
    def fill
      (0..@size).each do |y|
        (0..@size).each do |x|
          m = Adopt::DirectionDecoder::Position.new(x, y)
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
    
  end
end