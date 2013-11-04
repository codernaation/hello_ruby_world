module Adopt  
  module States
    class BodyCounters
      attr_accessor :males, :females

      def initialize
        @males = []
        @females = []
      end
    end

    class Menstruation 
      attr_accessor :body_counters
      def initialize
        @body_counters = BodyCounters.new
      end

      def wait
        
      end
    end

    class Ovulation 
      attr_accessor :body_counters
      def initialize 
        @body_counters = BodyCounters.new
      end

      def add_sex_with male = Male.new(3, 3)
        sex_partner male
      end

      private

      def sex_partner male
        @body_counters.males << male
      end
    end

    class WalkingUp 
      attr_accessor :body_counters
      def initialize
        @body_counters = BodyCounters.new
      end

      def speak 
        return if @body_counters.males.empty? 
        @body_counters.males.first
      end
    end

    class WalkingDown 
      attr_accessor :body_counters
      def initialize
        @body_counters = BodyCounters.new
      end

      def ask male
        return if male.females.empty?
        @body_counters.females << male.females.first
      end
    end

    class BodyState
      attr_reader :state
      def initialize number
        @state_circle = [Menstruation.new, WalkingUp.new, Ovulation.new, WalkingDown.new]
        @state = @state_circle[number]
        round_until_equal
      end

      def next_state
        body_counters_dump = Marshal.dump @state.body_counters 
        round
        @state = @state_circle.first
        @state.body_counters = Marshal.load body_counters_dump
      end

      private
      def round
        @state_circle.push @state_circle.shift
      end

      def round_until_equal
        until @state_circle.first == @state
          round
        end
      end
    end
  end
end