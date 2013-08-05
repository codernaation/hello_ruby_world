module Adopt
  module Interpreter
    class Expression 

    end

    class Parser < Positions::Grid

      attr_accessor :objects
      def initialize text
        @objects = Environment::Container.new
        @tokens = text.scan(/\(|\)|[\w\.\*]+/).uniq
        @file = File.new("population.html", 'w')
      end

      def next_token
        @tokens.shift
      end

      def random_gender
        case rand(2)
          when 0
            gender = Gender::Male.new(rand(5), rand(3))
          when 1
            gender = Gender::Female.new(rand(5), rand(3))
        end
        gender
      end

      def expression
        until (@tokens.empty?) 
          token = next_token

          if token == nil
            puts "nil"
            return nil
          
          elsif token == '('
            result = expression
            raise "Expected (" unless next_token == ')'
            result

          elsif (token =~ /^[A-Z]?/) == 0
            units = token.scan(/./)
            units.shift
            unless units.empty?
              main = Units::UnitBuilder.new units.pop
              main.add_gender random_gender
              main.add_picture 
              @objects.add_source main.unit
              @file.write "<li>unit #{main.unit.description.capitalize} was successfully created</li>"
            end  

          else 
            raise "Unexpected token #{token}"
          end
        end
      end

      def units
        @objects.sut
      end

      def descriptions
        @objects.sut.each do |o|
          @file.write o.description
        end
        @file.close
      end
    end
  end
end

