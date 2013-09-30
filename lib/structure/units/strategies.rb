module Adopt
  module Strategies
    class Rang
      attr_accessor :power, :value
      def initialize 
        @power = 0
        @value = 0
      end

      def reaction? this, someone
        raise "Abstract method called"
      end
    end

    class AlfaRang < Rang
      def initialize
        super
        @value = 2
      end

      def reaction? someone 
        if @power > someone.rang.power
          @power -= someone.rang.power 
          return true
        else
          return false
        end
      end
    end

    class BetaRang < Rang
      def initialize 
        super
        @value = 1
      end
      def reaction? someone 
        if @value >= someone.rang.value
          if @power > someone.rang.power
            @power -= someone.rang.power 
            return true
          else
            return false
          end
        else
          return false
        end
      end
    end

    class OmegaRang < Rang
      def initialize 
        super
      end

      def reaction? someone 
        if someone.rang.value == 0
          if @power > someone.rang.power 
            @power -= someone.rang.power
            return true
          else
            return false
          end
        else
          return false
        end
      end
    end
  end
end