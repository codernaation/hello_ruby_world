module Adopt
  module Environment

    class Container
      
      attr_accessor :sut
      def initialize
        @sut = [] 
      end

      def add_source source
        @sut << source
      end

      def show
        if @sut.empty?
          "Doesn't know anythink!!"
        else
          @sut.each do |unit|
            p unit
            unit.description unless unit.nil?
          end
        end        
      end
    end
  end
end
