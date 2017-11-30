
def has_a_b?(string)
  #if string =~ /b/
  if /b/.match(string)
    puts "We have a match!"
  else
    puts "no match here."
  end
end

has_a_b?("basketball")
has_a_b?("football")
has_a_b?("hockey")
has_a_b?("golf")