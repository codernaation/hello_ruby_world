module Adopt
  module Gender   
    RANGS = {
      2 => "alfa",
      1 => "beta",
      0 => "omega"
    }
    POWER = {
      4 => "Chief",
      3 => "Powerfull",
      2 => "Strong",
      1 => "Good",
      0 => "Week"
    }

    class Male
      attr_accessor :power, :rang

      def initialize power, rang
        @power = POWER[power]
        @rang = RANGS[rang]
        @females = []
      end

      def add_sex_with female = Female.new(3, 3)
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
        "He is #{@power} male belongs to #{@rang} group."
      end

      def to_s
        "Male"
      end

      private

      def sex_partner female
        @females << female
      end 

    end

    class Female
      attr_accessor :power, :rang

      def initialize power, rang
        @power = POWER[power]
        @rang = RANGS[rang]
        @males = []
      end

      def add_sex_with male = Male.new(3, 3)
        sex_partner male
      end

      def males_count
        @males.size
      end

      def males_info
        @males.each do |m| 
          m.resume
        end
      end

      def description
        "She is #{@power} female belongs to #{@rang} group."
      end

      def to_s
        "Female"
      end

      private

      def sex_partner male
        @males << male
      end
    end
  end
end