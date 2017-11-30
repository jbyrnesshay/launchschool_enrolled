

talk = Proc.new do 
  puts "* am talking"
end

talk.call

talk2 = Proc.new do |name|
  puts "I am talking to #{name}"
end

talk2.call "bob"