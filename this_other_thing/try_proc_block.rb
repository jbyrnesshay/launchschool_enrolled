



my_anti_american_proc = Proc.new { |item| puts item }



def do_thing(proc)
  ('a'..'g').each { |letter| proc.call letter }
end


do_thing(my_anti_american_proc)

