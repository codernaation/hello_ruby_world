module Adopt 
  module Sex
    class Pair
      attr_accessor :male, :female, :time, :id
      def initialize male, female
        @male = male 
        @female = female 
        @time = time
        @id = @male.object_id + @female.object_id
        init_instances
      end

      def description
        "<div style=\"color: 'green'\">
          #{@male.description}<br>
          #{@female.description}<br>
          They were having sex for #{@time} hour(s).<br>
        </div>"
      end

      private
      def init_instances
        @male.add_sex_with @female
        @female.add_sex_with @male
      end
    end

    class GroupAnalize

      attr_accessor :sex_incidents
      
      def initialize 
        @sex_incidents = {}
      end

      def add_pair pair = Pair.new
        if @sex_incidents.has_key? pair.id  
          @sex_incidents[pair.id] += 1
        else
          @sex_incidents.store( pair.id, 1)
        end
      end

      def by_pairs
        @sex_incidents.each do |k,v|
          "Pair #{k} had sex #{v} times."
        end
      end
    end
  end
end