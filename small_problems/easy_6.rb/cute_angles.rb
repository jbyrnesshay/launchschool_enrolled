DEGREE = "\xC2\xB0"
=begin
Write a method that takes a floating point number 
that represents an angle between 0 and 360 degrees 
and returns a String that represents that angle in degrees, 
minutes and seconds. You should use a degree symbol (°) 
to represent degrees, a single quote (') to represent minutes, 
and a double quote (") to represent seconds. 
A degree has 60 minutes, while a minute has 60 seconds.

Examples:
=end


def dms(angle_to_parse)
  angles = angle_to_parse.floor
  minutes = (((angle_to_parse - angles) * 0.6) * 100)
  seconds = ((minutes) - (minutes).floor) * 60
 # p angles
 # p minutes
  #p seconds
  #format("%02d%s%02d\'%02d\"", angles, DEGREE, minutes.to_i, seconds.to_i)
  "%02d%s%02d\'%02d\"" %[angles, DEGREE, minutes.to_i, seconds.to_i]
  
  #%(#{angles}#{DEGREE[]}#{minutes.to_i}\'#{seconds.to_i}\")
end

dms(76.73)




p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) #== %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(00°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
 
 