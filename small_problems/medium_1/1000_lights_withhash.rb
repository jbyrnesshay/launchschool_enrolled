




def create_lights(size) 
  lights = Hash.new 
  1.upto(size) do |i|
    lights[i] = 'off'
  end
  lights
end

 



def which_on(lights)
  lights.select {|position, state| state == 'on' }.keys
end

def toggle_nth(lights, nth)
  lights.each do |key, value| 
    if key % nth == 0
      lights[key] = (value == 'off') ? 'on' : 'off' 
    end

   end
end

def toggle_lights(size)
  lights = create_lights(size)
 
  1.upto(size) do |iteration|
     toggle_nth(lights, iteration)
     on = lights.select do |light, state|
     state == 'on'
  
      end
      off = lights.select do |light, state|
          state == 'off'
      end
      p "round #{iteration}: lights #{on.keys.join(', ')} are on.   lights #{off.keys.join(', ')} are off"
  end
  which_on(lights)
end
p toggle_lights(10)