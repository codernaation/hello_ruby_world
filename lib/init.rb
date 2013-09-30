require_relative 'structure/map/cell/direction'
require_relative 'structure/map/cell/cell_base'
require_relative 'structure/map/cell/cell_api'
require_relative 'structure/map/cell/cell'
require_relative 'structure/map/grid/console_output'
require_relative 'structure/map/grid/html_output'
require_relative 'structure/map/grid/grid_init'
require_relative 'structure/map/grid/grid'
require_relative 'structure/map/container'
require_relative 'structure/units/strategies'
require_relative 'structure/units/state'
require_relative 'structure/units/unit_builder'
require_relative 'structure/units/gender'
require_relative 'exeptions/errors_types'
require_relative 'operations/interpreter/parser'
require_relative 'operations/arbiter/arbiter'
require_relative 'operations/arbiter/different'
require_relative 'operations/arbiter/similar'
require_relative 'operations/commander'
require_relative 'operations/sex'

controller = Adopt::Commander.new ("T + Tx + Tz + Td + Tq"), 4 #+ Ts + Tt + Tw + Te + Tr+ Ty + Tu + Ti + To + Tp + Ta + Tf + Tg + Th"), 14
start = Time.now
1.upto(100) {controller.step_forward}
puts "#{Time.now - start}"
controller.all
# x = Adopt::Units::UnitBuilder.new "x"
# f = Adopt::Gender::Female.new 3,2,2
# x.add_gender f
# c = Adopt::Positions::Cell.new 9
# c.bind_unit x.unit
# c.behavior
# g = Adopt::Positions::Grid.new 4

# s = Adopt::Units::UnitBuilder.new "s"
# f = Adopt::Gender::Female.new 4,2,2
# s.add_gender f
# v = Adopt::Positions::Cell.new 2
# v.bind_unit s.unit
# z = Adopt::Units::UnitBuilder.new "z"
# m = Adopt::Gender::Male.new 3,2
# z.add_gender m
# r = Adopt::Positions::Cell.new 9
# r.bind_unit z.unit


