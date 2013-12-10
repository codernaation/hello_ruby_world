module Automatic
  module Terrains
    module Grids
      module ConsoleOutput
        
        def print_ocupate
          @collection.each do |y|
            y.each do |x|
              x.occupated? ? print_gender(x.occupator) : printf(" .")
            end; puts
          end; puts
        end

        def print_types
          @collection.each do |y|
            y.each do |x|
              printf("%3d|", x.type)
              printf("%1d%2d", x.x_pos, x.y_pos)
            end; puts
          end
        end

        private 

        def print_gender unit
          unit.male? ? printf("%s|", unit.label) : printf("|%s", unit.label)
        end

      end
    end
  end  
end
