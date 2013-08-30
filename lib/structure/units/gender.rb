module Adopt
  module Gender   
    RANGS = {
      2 => 'Adopt::Strategies::AlfaRang.new',
      1 => 'Adopt::Strategies::BetaRang.new',
      0 => 'Adopt::Strategies::OmegaRang.new'
    }

    POWER = {
      4 => 'Hero',
      3 => 'Powerfull',
      2 => 'Strong',
      1 => 'Good',
      0 => 'Week'
    }

    BEAUTY = {
      4 => 'Ideal',
      3 => 'Beautyfull',
      2 => 'Normal',
      1 => 'Ugly',
      0 => 'Invalid'
    }

    class Male
      attr_accessor :power, :rang, :females

      def initialize power, rang
        @rang = eval(RANGS[rang])
        @rang.power = power
        @females = []
      end

      def add_sex_with female
        sex_partner female
      end

      def females_count
        @females.size
      end

      def females_info
        @females.each do |f| 
          f.resume
        end
      end

      def description
        "He is #{POWER[@rang.power]} male."
      end

      private
      def sex_partner female
        @females << female
      end 

    end

    class Female
      attr_accessor :beauty, :body

      def initialize beauty, rang, state
        @beauty = BEAUTY[beauty]
        @body = Adopt::States::BodyState.new state
      end    

      def males_count
        @body.state.body_counters.males.size
      end

      def males_info
        @body.state.body_counters.males.each do |m| 
          m.resume
        end
      end

      def state_symbolize
        @body.state.class.to_s.split('::').last.downcase.to_sym
      end

      def description
        "She is #{@beauty} female."
      end

      private
      def sex_partner male
        @males << male
      end
    end
  end
end