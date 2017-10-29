#Given this data structure write some code 
#to return an array containing the colors of 
#the fruits and the sizes of the vegetables. 
#The sizes should be uppercase and 
#the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

#The return value should look like this:

#[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

array = []
hsh.each_value do |values|
  if values[:type] == 'fruit'
    array << values[:colors].map do |color|
      color.capitalize!
    end
  elsif values[:type] == 'vegetable'
    array << values[:size].upcase!
  end
end
puts array.inspect