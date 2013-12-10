module Automatic
  module Individuals 
    module Genders
      module Constants
         
        RANKS = {
          2 => 'Automatic::Individuals::Genders::Males::Strategies::Alfarank',
          1 => 'Automatic::Individuals::Genders::Males::Strategies::Betarank',
          0 => 'Automatic::Individuals::Genders::Males::Strategies::Omegarank'
        }

        POWER = {
          4 => 'Hero',
          3 => 'Powerful',
          2 => 'Strong',
          1 => 'Good',
          0 => 'Weak'
        }

        BEAUTY = {
          4 => 'Ideal',
          3 => 'Beautyful',
          2 => 'Normal',
          1 => 'Ugly',
          0 => 'Invalid'
        }

      end
    end
  end
end
