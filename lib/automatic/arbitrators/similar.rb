module Automatic
  module Arbitrators
    module TwoMalesCase
    
      def perform_ritual 
        batle? ? @this.transfer(@that) : false
      end

      private
      def batle? 
        @this.occupator.gender.rank.reaction? @that.occupator.gender.rank
      end

    end
  end
end
