class Pair
      attr_accessor :unit_male, :unit_female, :time, :id
        @id = @unit_male.object_id + @unit_female.object_id
        @unit_male.gender.add_sex_with @unit_female.gender
        @unit_female.gender.body.state.add_sex_with @unit_male.gender
        @sex_incidents = {}
      end

      def add_pair pair
        if @sex_incidents.has_key? id 
          @sex_incidents[id][:count] += 1       
        else
          @sex_incidents.store(
            id, 
            { 
              male: male.label, 
              female: female.label,
              count: 1 
            }
          )
        end
      end

      def by_pairs
        statistic = Array.new
        @sex_incidents.each_value do |row|
          statistic.push "Male #{row[:male].capitalize} and female #{row[:female].capitalize} had sex #{row[:count]} times.<br>"
        end
        statistic.join '<br>'
      end
    end