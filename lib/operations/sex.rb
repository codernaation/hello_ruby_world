module Adopt 
  module Sex
    class Pair
      attr_accessor :unit_male, :unit_female, :time, :id
      def initialize unit_male, unit_female
        @unit_male = unit_male 
        @unit_female = unit_female 
        @time = time
        @id = @unit_male.object_id + @unit_female.object_id
        init_instances
      end

      def description
        "<div style=\"color: green\">
          #{@male.description}<br>
          #{@female.description}<br>
          They were having sex for #{@time} hour(s).<br>
        </div>"
      end

      private
      def init_instances
        @unit_male.gender.add_sex_with @unit_female.gender
        @unit_female.gender.body.state.add_sex_with @unit_male.gender
      end
    end

    class GroupAnalize

      attr_accessor :sex_incidents
      
      def initialize 
        @sex_incidents = {}
      end

      def add_pair pair
        if @sex_incidents.has_key? pair.id 
          @sex_incidents[pair.id][:count] += 1       
        else
          @sex_incidents.store(pair.id, { :male => pair.unit_male.description, 
                                          :female => pair.unit_female.description,
                                          :count => 1 })
        end
      end

      def by_pairs
        statistic = Array.new
        @sex_incidents.each_value do |row|
          statistic.push "Male #{row[:male].capitalize} and female #{row[:female].capitalize} had sex #{row[:count]} times."
        end
        statistic.join '<br>'
      end
    end
  end
end