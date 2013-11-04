
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
    WAYS = ['N','NE','E','SE','S','SW','W','NW']
    CELL_TYPES = {
      1 => ['E','SE','S'],
      2 => ['N','NE','E','SE','S'],
      3 => ['N','NE','E'],
      4 => ['W','NW','N','NE','E'],
      5 => ['W','NW','N'],
      6 => ['S','SW','W','NW','N'],
      7 => ['S','SW','W'],
      8 => ['E','SE','S','SW','W'],
      9 => ['N','NE','E','SE','S','SW','W','NW']
    }

    class Position
      attr_accessor :x_pos, :y_pos
      def initialize x = 0, y = 0
        @x_pos = x
        @y_pos = y
      end

      def to_a
        [@x_pos,@y_pos]
      end
    end

    class Cell < Position
      
      include Adopt::DirectionDecoder
      attr_accessor :ways_to_move, :type, :cell_ocupator

      def initialize type
        @ocupate = false
        @cell_ocupator = nil
        @current_method = nil
        @type = type
        @ways_to_move = CELL_TYPES[@type]
        @current_method = nil
        super 0, 0
      end

      def ocupate?
        @ocupate
      end

      def bind_unit unit
        begin
          @cell_ocupator = unit if unit.instance_of? Adopt::Units::Unit
          @ocupate = true
        rescue ArgumentTypeError, 'Expected Adopt::Units::Unit in 1st argument'
        end
      end

      def unbind_unit
        @ocupate = false
        @cell_ocupator = nil
      end

      def unit_transfer other_cell
        unit = @cell_ocupator
        unbind_unit
        other_cell.bind_unit unit
      end

      def update_position pos
        @x_pos = pos.x_pos
        @y_pos = pos.y_pos
        self
      end

      def position? pos
        (@x_pos == pos.x_pos) && (@y_pos == pos.y_pos)
      end

      def random_direction 
        @ways_to_move[rand(ways_to_move.size)]
      end

      def behavior
        if male?
          @current_method = self.gender.rang.method(:reaction?) 
        elsif female? 
          female = self.gender.body.state
          [:speak, :ask, :add_sex_with, :wait].each do |msg|
            @current_method = female.method(msg) if female.respond_to?(msg) 
          end
          return @current_method
        end
      end


      def move grid_get_method, file, insidence_add
        find_candidate_cells_in_ways(grid_get_method)
        attempt = false
        until attempt
          next_cell = @candidate_cells[rand(@candidate_cells.size)]
          file.write "<li>#{next_cell.x_pos} #{next_cell.y_pos}"
            if next_cell.female? && self.male?
              case next_cell.gender.state_symbolize
              when :ovulation
                pair = Adopt::Sex::Pair.new(self.cell_ocupator, next_cell.cell_ocupator)
                insidence_add.call pair
                file.write " <div class=\"sex\"><strong>Sex between:</strong><br>
                  #{self.descriptions}<br>
                  #{next_cell.descriptions}<br></li></div></div>"
                attempt = true
                self.picture.add_source next_cell.cell_ocupator
              when :menstruation
                attempt = true
                self.picture.add_source next_cell.cell_ocupator 
                file.write " She has menstruation.</li></div>"
              when :walkingup
                self.picture.add_source next_cell.behavior.call
                attempt = true
                self.picture.add_source next_cell.cell_ocupator
                file.write " she wants to ask.</li></div>"
              when :walkingdown
                next_cell.behavior.call self.gender
                attempt = true
                self.picture.add_source next_cell.cell_ocupator
                file.write " she wants to speak.</li></div>"
              end
            elsif next_cell.male? && self.male?
              file.write " <div class=\"fight\"><strong>Two males</strong> (before):<br>
                His power is #{self.gender.rang.power} rang is #{self.gender.rang.value}<br>
                Oponent power is #{next_cell.gender.rang.power} rang is #{next_cell.gender.rang.value}<br>"
              if (self.behavior.call next_cell.gender)
                unit_transfer next_cell 
                file.write " After batle.<br> 
                  His power is #{next_cell.gender.rang.power}<br>
                  Oponent is DEAD</li>"
              elsif !(self.behavior.call next_cell.gender)
                attempt = false
                file.write " self desided to escape.</li>"
                self.picture.add_source next_cell.cell_ocupator
              end
            elsif !next_cell.ocupate?
              file.write " |_|</li></div>"
              attempt = true
              self.unit_transfer next_cell
            else
              attempt = false
              file.write " attemp is not success.</li>"
            end
        end
        self.gender.rang.power += 1 if self.male? && (self.gender.rang.power < 4)
        self.gender.body.next_state if self.female?          
      end

      def method_missing name, *args
        @cell_ocupator.send name, *args if !@cell_ocupator.nil?
      end

      private

      def find_candidate_cells_in_ways grid_get_method
        @candidate_cells = []
        @ways_to_move.each do |way|
          position = way2pos way
          potential_cell = grid_get_method.call(position['x'], position['y']) 
          @candidate_cells << potential_cell
        end
      end
    end
  end
end
