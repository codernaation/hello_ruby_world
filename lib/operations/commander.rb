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
      o_cells.each do |this_cell|
        @file.write "<div class=\"simple_log\">"
        attempt = false
        until attempt
          way = this_cell.random_direction
          @file.write "<li>#{way} #{this_cell.cell_ocupator.description} #{this_cell.cell_ocupator.gender} "
          pos = this_cell.way2pos way
          @file.write "(#{pos['x']}; #{pos['y']})</li>" 
          next_cell = @grid.get_cell_by_position(pos['x'], pos['y'])
          if no_cells.include? next_cell 
            attempt = true
            @file.write "#{attempt} <br></div>"
            unit = this_cell.cell_ocupator
            this_cell.unit_transfer next_cell
          elsif ((next_cell.cell_ocupator.gender.to_s == "Female") && 
            (this_cell.cell_ocupator.gender.to_s == "Male"))
            pair = Adopt::Sex::Pair.new(this_cell.cell_ocupator.gender, next_cell.cell_ocupator.gender)
            @incidents.add_pair pair
            @file.write "<br>#{pair.description}<br>"
            attempt = true
          elsif ((next_cell.cell_ocupator.gender.to_s == "Male") && 
            (this_cell.cell_ocupator.gender.to_s == "Female"))
            @file.write "<strong>Female can't go to Male's cell</strong><br>"
          else 
            @file.write "<strong>Male can't go to Male's cell</strong><br>"
            attempt = false
          end
        end
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