module Automatic
  module Terrains
    module Cells
      module Occupations

        def occupated?
          !@occupator.nil?
        end

        def bind unit
          @occupator = unit
        end

        def unbind
          @occupator = nil
        end

        def transfer other_cell
          other_cell.bind @occupator
          unbind
          !occupated? && other_cell.occupated?
        end

        def has_male?
          @occupator.male? if occupated?          
        end

        def has_female?
          @occupator.female? if occupated?
        end
      end
    end          
  end
end