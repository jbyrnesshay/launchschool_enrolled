require 'date'

def time_of_day(minutes)
  hours, minutes = (minutes).divmod(60)
  clock_hour = hours % 24
  #time_string = "%02d:%02d" %[clock_hour, minutes]
  format("%02d:%02d", clock_hour, minutes)
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


=begin
Further Exploration

How would you approach this problem if you were allowed to use ruby's 
Date and Time classes? Suppose you also needed to consider the day of week? 
(Assume that delta_minutes is the number of minutes before or after 
midnight between Saturday and Sunday; in such a method, 
a delta_minutes value of -4231 would need to produce a return value 
of Thursday 01:29.)
=end
 

def hilarious(minutes)
  now = Date.today
  today_date = now.day 
  hours,minutes = minutes.divmod(60)
  days,hours = hours.divmod(24)
  default_wday = 0
  current_day = (default_wday + days) % 7
  current_hour = hours
  current_minutes = minutes
  time = ''
  loop do
   time = Time.new(now.year, now.month, today_date, current_hour, current_minutes)
   break if time.wday == current_day
   (days <=> 0) == -1 ? today_date -= 1 : today_date += 1
  end
  time.strftime("%A  %H:%M")
end

p hilarious(-4231)