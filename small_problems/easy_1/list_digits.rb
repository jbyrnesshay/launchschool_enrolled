#Write a method that takes one argument, a positive integer, 
#and returns a list of the digits in the number.

# my original solutions
#non mathematical warmup version
def digit_list(num)
  string = num.to_s
  array = string.split('')
  array.map {|num| num.to_i}
end
puts digit_list(4587).inspect


#more mathematical version
def digit_list_math(num)
  array = []
  while num != 0
     array.unshift(num % 10)
     num = (num - (num % 10)) / 10  
  end
  array
end
puts
puts digit_list_math(515589543).inspect


# class solutions
