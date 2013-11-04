
  #                       N
  #     ---------------------------------------
  #     |           |             |           |
  #     |           |             |           |
  #     |     1     |      8      |     7     |
  #     |           |             |           |
  #     |           |             |           |
  #     ---------------------------------------
  #     |           |             |           |
  #     |           |             |           |
  # W   |     2     |      9      |     6     |  E
  #     |           |             |           |
  #     |           |             |           |
  #     ---------------------------------------
  #     |           |             |           |
  #     |           |             |           |
  #     |     3     |      4      |     5     |
  #     |           |             |           |
  #     |           |             |           |
  #     ---------------------------------------
  # 
  #                         S
module Adopt
  module Positions


    class Cell < Adopt::DirectionDecoder::Position
      
      include Adopt::DirectionDecoder
      include Adopt::CellBase
      include Adopt::CellApi

      attr_accessor :ways_to_move, :type, :ocupator

      def initialize type        
        @ocupator = nil
        @type = type
        @ways_to_move = CELL_TYPES[@type]
        @choises = Adopt::Arbiter::Choise.instance
        super 0, 0
        @cell_outer_conditions = { next_cell: false, batle: false, sex: false }
      end      

      def behavior
        if male?
          @current_method = self.gender.rang.method(:reaction?) 
        elsif female? 
          female = self.gender.body.state
          [:speak, :ask, :add_sex_with, :wait].each do |msg|
            @current_method = female.method(msg) if female.respond_to?(msg) 
          end
          @current_method
        end
      end

      def move
        find_candidate_cells_in_ways
        attempt = false
        until attempt
          next_cell = @candidate_cells[rand(@candidate_cells.size)]
          self.write "<li> #{self.description.capitalize} #{next_cell.x_pos} #{next_cell.y_pos}"
          attempt = @choises.resolve self, next_cell             
        end
      end

      def method_missing name, *args
        @ocupator.send name, *args unless @ocupator.nil?
      end

      private

      def find_candidate_cells_in_ways
        @candidate_cells = []
        @ways_to_move.each do |way|
          position = way2pos way
          potential_cell = self.get_cells(position['x'], position['y']) 
          @candidate_cells << potential_cell
        end
      end
    end
  end
end
