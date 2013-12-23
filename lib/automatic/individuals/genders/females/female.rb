module Automatic
  module Individuals 
    module Genders  
      module Females

        class Female
          attr_reader :rank
          attr_accessor :beauty, :body

          def initialize beauty, rank, state
            @beauty = Genders::Constants::BEAUTY[beauty]
            @rank = rank
            @body = States::BodyState.new state
          end    

          def method_missing name, *args
            @body.send(name, *args) 
          end

          def update
            next_state
          end

          def description
            "She is #{@beauty} female."
          end

        end

      end
    end
  end
end
