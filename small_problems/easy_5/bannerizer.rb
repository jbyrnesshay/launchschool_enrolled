=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

=end




def truncate(message)
  line = "| #{message} |"
  length = message.length
  screen_width = 10
  if line.size > screen_width
     truncate_by = line.size - length
     message = message.slice(0, screen_width - truncate_by)
  else 
    message
  end
end


def print_in_box(message)
  message = truncate(message)
  length = message.length
  horizontal_line = "+#{ '-' * (length+2)}+"
  empty_line = "|#{ ' ' * (length+2)}|"

  puts horizontal_line
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_line
end

#print_in_box('To boldly go where no one has gone before.')
#print_in_box('')
#print_in_box('Its very bad')


def wrap(message)
  line = "| #{message} |"
  length = message.length
  #p length
  #p line.size
  screen_width = 30
  
  if line.size > screen_width
     truncate_by = line.size - length
     truncated_line_width = screen_width - truncate_by
     message.scan(/[\s\w]{1,#{truncated_line_width}}/)
  else 
    #p message.scan(/[\s\w]+/)
    message.scan(/[\s\w]+/)
  end
end
def wrap_message_box(message)
  message_elements = wrap(message)
  #p message_elements
  length = message_elements[0].length
  #p length
  horizontal_line = "+#{ '-' * (length+2)}+"
  empty_line = "|#{ ' ' * (length+2)}|"

  puts horizontal_line
  puts empty_line
  message_elements.each do |line|
    chars_needed = (horizontal_line.length - line.length - 2) / 2
    adjust = line.length.odd? ? (chars_needed + 1) : chars_needed 
    #new_line = 
    puts "|#{' ' * chars_needed}#{line}#{' ' * adjust}|"
  end
  puts empty_line
  puts horizontal_line
end

wrap_message_box('To boldly go where no one has gone before.')
#wrap_message_box('')
wrap_message_box('Its very bad')