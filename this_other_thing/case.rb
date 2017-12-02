



def check_num_value(num)
  case  num
  when (0..50).include?(num)
   '0 and 50'
  when (51..100).include?(num)
   '51 and 100'
  else
   'above 100'
  end
 end


 p check_num_value(51)