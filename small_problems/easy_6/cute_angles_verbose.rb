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

MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTES = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTES

def dms(degrees_float)
  degrees_float = (180 - degrees_float) if degrees_float < 0
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTES)
=begin
  angles = angle_to_parse.floor
  minutes_and_seconds = ((angle_to_parse - angles) * 60)
  minutes = minutes_and_seconds.floor
  seconds =  (minutes_and_seconds - minutes) * 60
=end
  #format("%02d%s%02d\'%02d\"", angles, DEGREE, minutes.to_i, seconds.to_i)
  "%02d%s%02d\'%02d\"" %[degrees, DEGREE, minutes.to_i, seconds.to_i]
end
 



p dms(30) == %(30°00'00")
p dms(-90)
p dms(405)
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(00°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
 
 