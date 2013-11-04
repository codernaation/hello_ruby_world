module Adopt
  module CellApi
    def self.included(c)
      %w(next_cell batle sex).each do |method| 
        c.send(:define_method, :"#{method}?") {@cell_outer_conditions[method]}
        c.send(:define_method, :"set_#{method}") {@cell_outer_conditions[method] = true}
        c.send(:define_method, :"unset_#{method}") {@cell_outer_conditions[method] = false}
      end
    end

  end
end