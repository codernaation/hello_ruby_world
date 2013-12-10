module Automatic
  module Individuals 
    module Populations

      GENDERS = { 
        male: 'Automatic::Individuals::Genders::Males::Male', 
        female: 'Automatic::Individuals::Genders::Females::Female' }

      class Unit
        attr_reader :label
        attr_accessor :gender

        def initialize gender, label
          @gender = gender
          @label = label
        end

        def male?
          @gender.is_a? Individuals::Genders::Males::Male 
        end

        def female?
          @gender.is_a? Individuals::Genders::Females::Female
        end

        def current_action
          female? ? @gender.body.detect_action : @gender.rank.method(:reaction?)
        end

      end

      class ThreeRanksPopulation 

        attr_reader :units

        def initialize options = { total: 1}
          @units = []
          create_units(options[:total]) if options[:total]
          create_units(options[:elite], 2) if options[:elite]
          create_units(options[:normal], 1) if options[:normal]
          create_units(options[:weak], 0) if options[:weak]
          @units.flatten! 
        end

        def all_males
          @units.select{ |unit| unit.male? }
        end

        def all_females
          @units.select{ |unit| unit.female? }
        end

        private

        def create_units amount, type = rand(3)
          @units << (0...amount).map { |unit| unit = Unit.new(random_gender(type), random_letter) }          
        end

        def random_gender type
          rand(2).zero? ? GENDERS[:male].to_class.new(rand(5), type) : GENDERS[:female].to_class.new(rand(5), type, rand(4))
        end

        def random_letter
          ('a'..'z').to_a.sample
        end

      end

    end
  end
end
