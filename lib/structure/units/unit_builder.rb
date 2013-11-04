module Adopt
  module Units
    class Source
      attr_accessor :description

      def initialize description
        @description = description
      end
    end

    class Unit < Source
      attr_accessor :gender, :picture, :description

      def initialize description
        @gender  = 0
        @picture = 0
        super description
      end

      def male?
        @gender.respond_to?(:rang)
      end

      def female?
        @gender.respond_to?(:body) && @gender.respond_to?(:state_symbolize)
      end

      def descriptions
        " Unit #{@description.capitalize} - #{self.gender.description}"
      end
    end

    class UnitBuilder
      attr_accessor :unit

      def initialize literal
        @unit = Unit.new literal
      end

      def add_gender gender 
        @unit.gender = gender #if gender.instance_of? Gender::Male || gender.instance_of? Gender::Female
      end

      def add_picture picture = Environment::Container.new
        @unit.picture = picture if picture.instance_of? Environment::Container
      end
    end
  end
end