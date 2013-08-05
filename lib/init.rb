require_relative 'structure/map/direction'
require_relative 'structure/map/cell'
require_relative 'structure/map/grid'
require_relative 'structure/map/container'
require_relative 'operations/commander'
require_relative 'operations/sex'
require_relative 'operations/interpreter/parser'
require_relative 'structure/units/unit_builder'
require_relative 'structure/units/gender'
require_relative 'exeptions/errors_types'

controller = Adopt::Commander.new ("T + Tx + Tz + Td + Tq + Ts + Tt"), 6
start = Time.now
1.upto(100) {controller.step_forward; sleep(0.1)}
puts "#{Time.now - start}"
controller.all
