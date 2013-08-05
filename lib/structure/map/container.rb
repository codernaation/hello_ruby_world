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

      def descriptions
        if @sut.empty?
          "Doesn't know anythink!!"
        else
          @sut.each do |d|
            d.description
          end
        end        
      end
    end
  end
end
