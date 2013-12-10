module Automatic
  module Arbitrators
    
    class Arbiter

      include TwoMalesCase
      include MaleAndFemaleCase
      
      def initialize options
        @population = Individuals::Populations::ThreeRanksPopulation.new options[:population]
        @terrain = Terrains::Grids::BorderedGrid.new @population.units, options[:grid][:size]
        @candidate_cells = []
      end

      def resolve main_cell, next_cell
        @this, @that = main_cell, next_cell 
        next_free? ? @this.transfer(@that) : social_actions
      end

      def move
        @terrain.print_ocupate
        @terrain.get_cells_by_occupate(true).each do |this_cell|
          find_neighbours_of this_cell
          resolved = false
          until resolved
            resolved = resolve(this_cell, next_random_cell) 
          end
        end        
      end

      def find_neighbours_of cell
        @candidate_cells.clear
        cell.ways_to_move.each do |way|
          position = cell.way2pos(way)
          @candidate_cells.push @terrain.get_cell_by_position(position)            
        end
      end

      private 
      def next_random_cell
        @candidate_cells.sample
      end

      def next_free?
        !@that.occupated?
      end

      def different_gender?
        @this.has_male? && @that.has_female?         
      end

      def similar_gender?
        @this.has_male? && @that.has_male?        
      end

      def pick_female_action
        action = @that.occupator.gender.state_symbolize
        self.send(action)
      end

      def social_actions
        pick_female_action if different_gender?
        perform_ritual if similar_gender?
      end
    end 

  end  
end