module Adopt
  module HTMLOutput
    def render_ocupate
      
      row = ''
      @collection.each do |y|
        row.concat '<div class="row">'
        y.each do |x|
          if x.ocupate? 
            if x.sex?
              if x.male?
                row.concat "<div class=\"male_sex\">#{x.description}</div>" 
                # x.unset_sex
              else     
                row.concat "<div class=\"female_sex\">#{x.description}</div>" 
                # x.unset_sex
              end 
            else 
              if x.male?
                row.concat "<div class=\"male\">#{x.description}</div>" 
              else
                row.concat "<div class=\"female\">#{x.description}</div>"  
              end
            end
            
          else
            row.concat '<div class="cell"></div>'
          end
        end
        row.concat '</div>'
        @render_file.write row
        row = ''
      end
      @render_file.write '<br><br>'
    end

    def write_footer_for_render
      @render_file.write '</body></html>'
    end

    private

    def write_header
      @render_file.write '<!DOCTYPE html>
        <html>
        <head>
        <meta charset="utf-8" >
        <title>HTML5</title>
        <link rel="stylesheet" href="lib/css/mig.css">
        </head>
        <body class="render">
        <header>
          <h2>Show</h2>
        </header>'
    end

  end  
end