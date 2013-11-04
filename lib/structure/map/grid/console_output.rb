module Adopt
  module ConsoleOutput
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
      puts
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
    
  end  
end