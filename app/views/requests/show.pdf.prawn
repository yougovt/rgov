pdf.text "Formal request filed under the Right to Information Act (2005)", :size => 16, :style => :bold
pdf.move_down(30)

pdf.text "Central Public Information Officer (CPIO)" 
pdf.text "#{@request.page_id}"
pdf.move_down(15)

pdf.text "Dear Madam or Sir:"
pdf.move_down(15)

pdf.text "Subject: #{@request.sub}", :style => :bold
pdf.move_down(15)

pdf.text "I would like to seek answers to the following questions from the #{@request.page_id}:"

pdf.text "#{@request.body}"
pdf.move_down(15)

pdf.text "This request can be tracked at: http://www.rgov.in#{request_path(@request)}"
pdf.move_down(15)

pdf.text "Please send the requested information to: "
pdf.move_down(10)
pdf.text "#{@request.first_name} #{@request.last_name}"
pdf.text "#{@request.street1}"
pdf.text "#{@request.street2}"
pdf.text "#{@request.city}, #{@request.district}"
pdf.text "#{@request.state}"
pdf.text "PIN: #{@request.pin}"