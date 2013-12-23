require_relative 'automatic/terrains/positions/position'
require_relative 'automatic/terrains/cells/directions'
require_relative 'automatic/terrains/cells/occupations'
require_relative 'automatic/terrains/cells/cell'
require_relative 'automatic/terrains/grids/console_output'
require_relative 'automatic/terrains/grids/grid_init'
require_relative 'automatic/terrains/grids/grid'
require_relative 'automatic/individuals/genders/females/states'
require_relative 'automatic/individuals/genders/females/female'
require_relative 'automatic/individuals/genders/males/strategies'
require_relative 'automatic/individuals/genders/males/male'
require_relative 'automatic/individuals/genders/constants'
require_relative 'automatic/individuals/populations/population'
require_relative 'automatic/arbitrators/similar'
require_relative 'automatic/arbitrators/different'
require_relative 'automatic/arbitrators/arbiter'
require_relative 'automatic/core_extentions/string'

require 'yaml'

module Automatic
  def self.start
    config = YAML.load_file('lib/config.yml')
    world = Arbitrators::Arbiter.new config
    config[:times].times{ world.move }    
  end  
end
