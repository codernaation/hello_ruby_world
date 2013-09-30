require 'singleton'

module Adopt
  module Arbiter
    class Choise
      include Singleton
      def initialize 
        @different = DifferentSex.new
        @similar = SimilarSex.new
      end

      def resolve main_cell, next_cell
        if next_cell.female? && main_cell.male?
          action = next_cell.gender.state_symbolize
          return @different.send action, main_cell, next_cell         
        
        elsif next_cell.male? && main_cell.male?
          return @similar.ritual main_cell, next_cell 

        elsif !next_cell.ocupate?
          main_cell.write " |_|</li></div>"
          next_cell.set_next_cell
          return main_cell.unit_transfer next_cell
          
        else
          main_cell.write " attemp is not success.</li>"
          return false
        end
      end
    end 

  end  
end