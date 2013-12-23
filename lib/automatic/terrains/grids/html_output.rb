module Adopt
  module HTMLOutput
    # def render_ocupate
      
    #   # row = ''
    #   # @collection.each do |y|
    #   #   row.concat '<div class="row">'
    #   #   y.each do |x|
    #   #     if x.ocupated?
    #   #       if x.sex_male?
    #   #         row.concat "<div class=\"male_sex\">#{x.description} #{x.x_pos} #{x.y_pos}</div>" 
    #   #         x.unset_sex
    #   #       elsif x.sex_female?     
    #   #         row.concat "<div class=\"female_sex\">#{x.description} #{x.x_pos} #{x.y_pos}</div>" 
    #   #         x.unset_sex
    #   #       elsif x.male?
    #   #         row.concat "<div class=\"male\">#{x.description}</div>" 
    #   #       elsif x.female?
    #   #         row.concat "<div class=\"female\">#{x.description}</div>"  
    #   #       end
       
    #   #     else
    #   #       row.concat '<div class="cell"></div>'
    #   #     end
    #   #   end
    #   #   row.concat '</div>'
    #   #   @render_file.write row
    #   #   row = ''
    #   # end
    #   # @render_file.write '<br><br>'
    # end

    # def write_footer_for_render
    #   @render_file.write '</body></html>'
    # end

    # private

    # def write_header
    #   @render_file.write '<!DOCTYPE html>
    #     <html>
    #     <head>
    #     <meta charset="utf-8" >
    #     <title>HTML5</title>
    #     <link rel="stylesheet" href="lib/css/mig.css">
    #     </head>
    #     <body class="render">
    #     <header>
    #       <h2>Show</h2>
    #     </header>'
    # end

  end  
end