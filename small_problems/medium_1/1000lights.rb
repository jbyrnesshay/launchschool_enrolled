=begin


1000 Lights

You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

    round 1: every light is turned on
    round 2: lights 2 and 4 are now off; 1, 3, 5 are on
    round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
    round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
    round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].-
=end


def thousand_lights(num_lights)
  lights = [-1] * num_lights
  num_lights.times do |pass|
    lights.map!.with_index do |thing, i|
       if (i+1) % (pass + 1) == 0
         thing * -1
       else thing
       end
    end
  end
  result = []
  lights.each_with_index {|light, i| result << (i+1) if light.positive? }
  result
end


p thousand_lights(10)

#alternative take2

def thousand_lights2(num_lights)
  lights = Array.new(num_lights) {|index| (index + 1) * -1}
  (1..num_lights).each {|pass| lights.each_with_index { |light, i| lights[i] *= -1 unless !(light % pass).zero? }}
  lights.select {|light| light.positive?}
end

p thousand_lights2(10)

#alternative take3

def thousand_lights3(num_lights)
  lights = [false] * num_lights
  (1..num_lights).each do |pass|
    lights.map!.with_index {|light, i| (i+1) % pass == 0 ? (light == true ? false: true) : light}
  end
  lights.map.with_index {|light, i| i+1 if light}.reject(&:nil?)
end

p thousand_lights3(5)

#alternative take4

def thousand_lights4(num_lights)
  lights = [false] * num_lights
  values = [true, false]
  (1..num_lights).each do |pass|
    lights.map!.with_index {|light, i| (i+1) % pass == 0 ? ( values - [light] )[0] : light }
  end 
  #lights.map.with_index {|light, i| i+1 if light}.reject(&:nil?) 
  lights.map.with_index {|light, i| i+1 if light}.compact
end

p thousand_lights4(10)

#alternatie take5
def thousand_lights5(num_lights)
  lights = [false] * num_lights
  (1..num_lights).each do |pass|
    lights.map!.with_index {|light, i| (i+1).modulo(pass).zero? ? light ^ true : light }
  end
  lights.map.with_index {|light, i| i+1 if light}.compact
end

p thousand_lights5(10)