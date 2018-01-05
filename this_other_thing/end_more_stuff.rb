

strings = ["laboratory", "experiment", 1, "PansLabyrinth", "elaborate", "polar bear"]

strings.each do |string|
  begin 
    if /lab/ =~ string
      puts string 
    end
  rescue
    puts "#{string} is not a string"
  end
end