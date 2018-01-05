 
=begin
ALPHA_MAP = {
      0 => 'zero',
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen'
      }
=end
ALPHA_MAP = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)




def alphabetic_number_sortby(array)
  array.sort_by! do |num|
   #p ALPHA_MAP[num]
   ALPHA_MAP[num]
  end
end

p ALPHA_MAP
puts
p alphabetic_number_sortby((0..19).to_a) 
puts
#p alphabetic_number_sort((0..19).to_a) == [
#  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
 # 6, 16, 10, 13, 3, 12, 2, 0]

p ALPHA_MAP



def with_sort(array)
  array.sort do |a,b|
    ALPHA_MAP[a] <=> ALPHA_MAP[b]
  end
 
puts 'yes'
p with_sort((0..19).to_a) == [ 8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0]