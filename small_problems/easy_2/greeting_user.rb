

print "WHat is your name?  "
name = gets.chomp!

def greeting(name)

  if name.end_with?('!') 
    name.chop!
    "hello #{name}. why are we screaming?".upcase
  else "Hello #{name}"
  end
end


puts greeting(name)

