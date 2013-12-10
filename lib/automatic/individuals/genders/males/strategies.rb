module Automatic
  module Individuals 
    module Genders  
      module Males
        module Strategies

          class Rank
            attr_accessor :power, :value
            def initialize power
              @power = power
            end

            def reaction? someone_rank
              raise "Abstract method called"
            end

            def increase_power
              @power += 1 if @power < 4
            end

            def me_stronger? power
              @power > power
            end
          end

          class Alfarank < Rank
            def initialize power
              super power
            end

            def reaction? someone_rank 
              me_stronger?(someone_rank.power)
            end
          end

          class Betarank < Rank
            def initialize power
              super power
            end

            def reaction? someone_rank 
              lower_or_same_rang?(someone_rank) and me_stronger?(someone_rank.power)
            end

            def lower_or_same_rang? someone_rank
              someone_rank.kind_of?(Betarank) || someone_rank.kind_of?(Omegarank)
            end
          end

          class Omegarank < Rank
            def initialize power
              super power
            end

            def reaction? someone_rank 
              someone_rank.kind_of?(Omegarank) && me_stronger?(someone_rank.power)
            end
          end

        end
      end
    end
  end
end
