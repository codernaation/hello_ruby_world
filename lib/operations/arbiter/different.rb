module Adopt
  module Arbiter
    class DifferentSex

      def ovulation main_cell, next_cell, shared = {}
        main_cell.picture.add_source next_cell.ocupator.dup 
        pair = Adopt::Sex::Pair.new(main_cell.ocupator, next_cell.ocupator)
        
        main_cell.add_pair pair
        main_cell.set_sex
        next_cell.set_sex

        main_cell.write " <div class=\"sex\"><strong>Sex between:</strong><br>
          #{main_cell.descriptions}<br>
          #{next_cell.descriptions}<br></li></div></div>"
        true
      end

      def menstruation main_cell, next_cell, shared = {}
        main_cell.picture.add_source next_cell.ocupator.dup 
        main_cell.write " She has menstruation.</li></div>"
        true
      end

      def walkingup main_cell, next_cell, shared = {}
        main_cell.picture.add_source next_cell.ocupator.dup
        unless next_cell.behavior.call.nil?
          main_cell.picture.add_source next_cell.behavior.call.dup
        end
        main_cell.write " she wants to ask.</li></div>"
        true
      end

      def walkingdown main_cell, next_cell, shared = {}
        next_cell.behavior.call main_cell.gender
        main_cell.picture.add_source next_cell.ocupator.dup
        main_cell.write " she wants to speak.</li></div>" 
        true
      end
    end
  
  end
end
