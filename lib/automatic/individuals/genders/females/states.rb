module Automatic
  module Individuals 
    module Genders  
      module Females
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
            attr_reader :current_state, :current_action
            def initialize phase
              @state_circle = [Menstruation.new, WalkingUp.new, Ovulation.new, WalkingDown.new]
              @current_state = @state_circle[phase]
              @state_circle.rotate! until sync?
            end

            def next_state
              body_counters_dump = Marshal.dump @current_state.body_counters 
              @state_circle.rotate!
              @current_state = @state_circle.first
              @current_state.body_counters = Marshal.load body_counters_dump
            end

            def males_count
              @current_state.body_counters.males.size
            end

            def state_symbolize
              @current_state.class.to_s.symbolize
            end

            private
            def sync?
              @state_circle.first == @current_state
            end
          end

        end
      end
    end
  end
end
