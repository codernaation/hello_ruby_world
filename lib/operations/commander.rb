module Adopt
  class Commander
    def initialize str, size
      @file = File.new "Migration.html", "w" 
      @incidents = Adopt::Sex::GroupAnalize.new
      init_cell_share size
      @grid = Adopt::Positions::Grid.new @share_for_cell
      init_unit_share str
      @parser  = Adopt::Interpreter::Parser.new @share_for_unit
      start
    end

    def step_forward
      ocupated = @grid.get_cell_by_ocupate true
      nonocupated = @grid.get_cell_by_ocupate false 
      ocupated.each do |this_cell|
        @file.write "<div class=\"simple_log\">"
        this_cell.move
      end
      @grid.print_ocupate
      @grid.render_ocupate
    end

    def all
      cells = @grid.get_cell_by_ocupate true
      cells.each do |cell|
        @file.write cell.picture.show unless cell.picture.nil?
      end if !cells.empty?
      @file.write "#{@incidents.by_pairs} </body>
                    </html>"
    end

    private
    def init_cell_share size
      @share_for_cell = {
        write:    @file.method(:write),
        add_pair: @incidents.method(:add_pair),
        size:     size
      }
    end

    def init_unit_share str
      @share_for_unit = {
        by_pos:   @grid.method(:get_cell_by_position),
        str: str
      }
    end

    def start
      @parser.expression
      @grid.fill
      @grid.random_binding @parser.units
      @grid.print_ocupate
      @file.write "<!DOCTYPE html>
        <html>
        <head>
        <meta charset=\"utf-8\" >
        <title>HTML5</title>
        <link rel=\"stylesheet\" href=\"lib/css/mig.css\">
        </head>
        <body>
        <header>
          <h2>Migration log</h2>
        </header>"
    end
  end
end