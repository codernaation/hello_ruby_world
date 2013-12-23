module Automatic
  module Arbitrators
    module MaleAndFemaleCase

      def ovulation 
        # TODO: Add count of sex incidents
        # pair = Adopt::Sex::Pair.new(main_cell.occupator, next_cell.occupator)
      
        # main_cell.add_pair pair
        true
      end

      def menstruation 
        # main_cell.write " She has menstruation.</li></div>"
        true
      end

      def walkingup 
        # unless next_cell.occupator_behavior.call.nil?
        #   main_cell.picture.add_source next_cell.occupator_behavior.call.dup
        # end
        # main_cell.write " she wants to ask.</li></div>"
        true
      end

      def walkingdown 
        # next_cell.occupator_behavior.call main_cell.gender
        # main_cell.write " she wants to speak.</li></div>" 
        true
      end

    end
  end
end
