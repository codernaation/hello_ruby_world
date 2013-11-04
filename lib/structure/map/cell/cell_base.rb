module Adopt
  module CellBase

    def ocupate?
      !@ocupator.nil?
    end

    def bind_unit unit
      begin
        @ocupator = unit if unit.instance_of? Adopt::Units::Unit
      rescue ArgumentTypeError, 'Expected Adopt::Units::Unit in 1st argument'
      end
    end

    def unbind_unit
      @ocupator = nil
    end

    def unit_transfer other_cell
      unit = @ocupator
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
  end
end