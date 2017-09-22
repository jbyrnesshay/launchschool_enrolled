require 'multi_json'

class MyClass
  def to_proc
    puts "trying to covert to a proc"
    Proc.new {}
  end
end

[].map(&MyClass.new)

puts $LOADED_FEATURES.grep(/multi_json\.rb/)

puts $LOADED_FEATURES