module Automatic
  module Terrains
    module Grids
      
      class BorderedGrid
        include ConsoleOutput
        include GridBuilder

        def initialize units, size
          check_arguments( units.size, size) 
          @size = size
          build_and_random_bind units
        end     

        def build_and_random_bind units
          build
          units.each { |x| not_occupated_cells.sample.bind x }
        end

        def get_cells_by_occupate flag
          flag ? occupated_cells : not_occupated_cells
        end

        def get_cell_by_position position
          @collection[position.y_pos][position.x_pos] 
        end      

        private

        def occupated_cells 
          @collection.flatten.select { |x| x.occupated? } 
        end

        def not_occupated_cells 
          @collection.flatten.select { |x| !x.occupated? } 
        end

        def check_arguments population_size, grid_size
          quartern_grid = grid_size*grid_size/4
          raise LogicalError.new, "Grid size must be greater to accommodate all units." if population_size > quartern_grid
        end
      end

    end
  end
end

class Automatic::Terrains::Grids::LogicalError < StandardError ; end
