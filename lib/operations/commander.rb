module Adopt
  class Commander
    def initialize str, size
      @parser  = Adopt::Interpreter::Parser.new str
      @grid = Adopt::Positions::Grid.new size
      @file = File.new("migration.html", "w")
      @incidents = Adopt::Sex::GroupAnalize.new
      start
    end

    def step_forward
      o_cells = @grid.get_cell_by_ocupate true
      no_cells = @grid.get_cell_by_ocupate false 
      gg_by_pos_method = @grid.method :get_cell_by_position
      o_cells.each do |this_cell|
        @file.write "<div class=\"simple_log\">"
        this_cell.move gg_by_pos_method
        @file.write "</div>"
        no_cells = @grid.get_cell_by_ocupate false
      end
      puts
      @grid.print_ocupate
    end

    def all
      @file.write "#{@incidents.by_pairs} </body>
                    </html>"
    end

    private
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
        <link rel=\"stylesheet\" href=\"css/mig.css\">
        </head>
        <body>
        <header>
          <h2>Migration log</h2>
        </header>"
    end
  end
end