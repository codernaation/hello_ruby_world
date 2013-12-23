module Automatic
  module Individuals 
    module Genders  
      module Males
        
        class Male
          attr_reader :rank, :females

          def initialize power, rank
            @rank = Genders::Constants::RANKS[rank].to_class.new power
            @females = []
          end

          def add_sex_with female
            @females << female
          end

          def females_count
            @females.size
          end

          def update
            @rank.increase_power
          end

          def description
            "He is #{Genders::Constants::POWER[@rank.power]} male."
          end

        end

      end
    end
  end
end
