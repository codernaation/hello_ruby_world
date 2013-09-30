module Adopt
  module Arbiter
    class SimilarSex

      def ritual main_cell, next_cell, shared = {}

        before_demo main_cell, next_cell, shared = {}

        if (main_cell.behavior.call next_cell.gender)
          main_cell.unit_transfer next_cell 
          main_cell.write " After batle.<br> 
            His power is #{next_cell.gender.rang.power}<br>
            Oponent is DEAD</li></div></div>"
          true
        else
          main_cell.write " main_cell desided to escape.</li></div></div>"
          main_cell.picture.add_source next_cell.ocupator.dup
          false
        end    
      end

      private

      def before_demo main_cell, next_cell, shared = {}
        main_cell.write " <div class=\"fight\"><strong>Two males</strong> (before):<br>
        His power is #{main_cell.gender.rang.power} rang is #{main_cell.gender.rang.value}<br>
        Oponent power is #{next_cell.gender.rang.power} rang is #{next_cell.gender.rang.value}<br>"    
      end
    end

  end
end
