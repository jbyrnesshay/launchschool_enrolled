

question 3

Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)
# my_string = "pumpkins"
# my_array = ["pumpkins", "rutabaga"]

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
_____________________________________________________

question 4
To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)
my_string = "pumpkinsrutabaga"
my_array = ["pumpkins"]

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


question 5

How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid(color)
    if ["blue", "green"].include?(color)
       true
    else
      false
    end
end
#no he's asking something else
def color_valid(color)
  color == "blue" || color == "green"
end
)

