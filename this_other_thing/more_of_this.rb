def list names
  names = names.map {|hash| hash.map {|k,v| v }}.flatten
  case names.count
  when 0
    ''
  when 1
    names.first
  when 2
    "#{names.first} & #{names.last}"
  else
    names[names.size - 2] = "#{names[names.size - 2]} & #{names[names.size - 1]}"
    names.pop
    names[0..names.size - 1].join(', ') 
  end
end


#other

ggpasqualino, RyanBalfanz, rrsg123, MicaW, OtisAndLola, walidahmedelsayed (plus 18 more warriors)

def list names
  names = names.map { |name| name[:name] }
  last_name = names.pop
  return last_name.to_s if names.empty?
  "#{names.join(', ')} & #{last_name}"
end

8 similar code variations are grouped with this one
Show Variations

        Best Practices96
        Clever63
    6
    Fork
    Compare with your solution
    Link

mmmm, Snehal Dwivedi, EljamR, boom005

def list names
  names.map(&:values).join(', ').gsub(/, (\w+)$/, " & \\1")
end

        Best Practices19
        Clever154
    11
    Fork
    Compare with your solution
    Link

Ethane

def list names
  names.map { |h| h[:name] }.join(", ").reverse.sub(/,/, "& ").reverse
end

        Best Practices7
        Clever6
    0
    Fork
    Compare with your solution
    Link

Luckshot, oscar6654, timclarkfl

def list names
  ret = ""
  until names.length == 0
    if names.length >= 3
      ret << names.shift[:name] + ", "
    elsif names.length == 2
      ret << names.shift[:name] + " & "
    else
      ret << names.shift[:name]
    end
  end
  ret
end

1 similar code variation is grouped with this one
Show Variations

        Best Practices2
        Clever0
    1
    Fork
    Compare with your solution
    Link

kwokhuen

def list names
  return '' if names.empty?
  last = names.length != 1 ? " & #{names.pop[:name]}" : ""
  names.map!{|hash| hash[:name]}.join(', ') + last
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

zishe

def list names
  names.map { |x| x[:name] }.join(', ').sub(/(.*)(, )(.*)/, '\1 & \3')
end

        Best Practices1
        Clever6
    0
    Fork
    Compare with your solution
    Link

grantspeelman

def list names
  names = names.map{ |name_hash| name_hash.fetch(:name) }
  last_2_name = names.pop(2).join(' & ')
  names.push(last_2_name)
  names.join(', ')
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

jaketyo

def list names
  names.map { |n| n[:name] }.join(', ').gsub(/\b,\s(\w+)$/, ' & \1')
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

bestwebua

def list(names)
  names.map(&:values).join(', ').reverse.sub(/,/, '& ').reverse
end

        Best Practices1
        Clever0
    0
    Fork
    Compare with your solution
    Link

pietromaj

def list names
 array = names.map{|i| i[:name]}
 last2 = array.slice!(-2..-1)
 (array.push last2 ? last2.join(" & ") : last2).compact.join(", ")
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

muyifeng1988

def list names
  names.map(&:values).flatten.each_slice(names.size > 1 ? names.size - 1 : 1).map{|n| n.join(', ')}.join(' & ')
end

        Best Practices1
        Clever1
    0
    Fork
    Compare with your solution
    Link

kpwbo

def list names
  return "" if names.length == 0
  result = names.last[:name]
  return result if names.length == 1
  ampersand = true
  (1...names.length).each { |i|
    if ampersand
      result = " & " + result
      ampersand = false
    else
      result = ", " + result
    end
    result = names[names.length-1-i][:name] + result
  }
  result
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

angetheo

def list names
  # TODO
  names.map(&:values).join(', ').reverse.sub(',','& ').reverse
end

        Best Practices0
        Clever2
    0
    Fork
    Compare with your solution
    Link

joselfr

def list names
  names.map! {|n| n[:name]} if names

  case names.length
  when 0
    ''
  when 1
    names[0].to_s.dup
  when 2
    "#{names[0]} & #{names[1]}"
  else
    "#{names[0...-1].join(', ')} & #{names[-1]}"
  end

end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

mantharey

def list names
#   go through entire array]
#   if hash put that with a comma
#   unless there is only one more
#   no more " & " no last punc
  
  
  
  stringsArray = []
  
  names.each do |nameObject|
    stringsArray << nameObject[:name]
  end
  
  
  if stringsArray.length == 1
    return stringsArray.first
  end
  
  if stringsArray.length == 0
    return ''
  end
  
  
  last = stringsArray.pop()
  
  
  stringsArray.join(", ") + " & " + last
  
  
end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

katarzyna_wlk

def list names
  names_str = names.map { |h| h[:name] }.join(', ')
  names_str.reverse.sub(',', '& ').reverse
end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

joelt11753, FrodoSumkin

def list(names)
  names = names.map { |i| i[:name] }
  last = names.pop
  if names.size == 0
    last || ''
  else
    names.join(', ') + ' & ' + last
  end
end

1 similar code variation is grouped with this one
Show Variations

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

tungnt-580

def list names
   names.map! do |name|
     name[:name]
   end
   result = names.join(", ")
   result[result.rindex(',')] = '&' if names.length > 1
   result.sub("&", " &")
end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

cmm21

def list names
  names.map{|x| x.values}.join(", ").gsub(/(.*)(,)(.*)/, '\1 &\3')
end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

warkann

def list names
  names.map!(&:values).flatten!
  names.size >= 2 ? names[0..-2].join(', ') + ' & ' + names.last : names.first || ''
end

        Best Practices0
        Clever1
    0
    Fork
    Compare with your solution
    Link

drcomaneci

def list names
  return "" if !names || names.size == 0
  return names[0][:name] if names.size == 1
  names[0, names.size - 1].map{ |name| name[:name]}.join(", ") +" & " + names.last[:name]
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

jomar2530

def list names

  name_list = []

  names.each do |name|
    name.each do |k, v|
      name_list.push(v)
    end
  end
  
  if name_list.length <= 1
    name_list.join('')
  else
    name_list[0..-2].join(", ") + " & " + name_list[-1]  
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

tetradodeca

def list names
  if names.count == 1
    names.map { |x| x[:name] }.join
    
  elsif names.count == 2
    first_two = names.first(2)
    first_two.map { |x| x[:name] }.join(" & ")
    
  elsif names.count > 2
    last_two = names.last(2)
    last = last_two.map { |x| x[:name] }.join(" & ")
    names[0..-3].map { |x| x[:name] }.join(", ") + ", " + last
  
  else names.count == 0
    return ""
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

rjohnson4444

def list names
  all_names = names.map { |obj| obj[:name] }

  return "" if all_names.empty?
  
  string_of_names = ''
  string_of_names << all_names.last if all_names.count == 1
  string_of_names << all_names.join(" & ") if all_names.count == 2
  
  if all_names.count > 2
    last_two_names = all_names.last(2).join(" & ")
    string_of_names << all_names[0..-3].join(", ")
    string_of_names << ", #{last_two_names}"
  end
  string_of_names
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

jlaurenti12

def list names
  newString = ""
  currentIndex = 0
  if names.length > 1
    while currentIndex < names.length - 2
      newString += names[currentIndex][:name] + ", "
      currentIndex += 1
    end
    newString += names[names.length - 2][:name] + " & " + names[names.length - 1][:name]
    return newString
  elsif names.length == 1
    return newString += names[0][:name]
  else
    return newString
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Nephysta

def list names
  return '' if names.count == 0
  string = names.slice!(0)[:name]
  names.each_with_index { |hash, i| string = (i + 1 < names.count) ? "#{string}, #{hash[:name]}" : "#{string} & #{hash[:name]}" }
  string
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

ZacharyByers

def list names
  name_string = ''
  names.each_with_index do |name, i|
    if i == (names.length - 2)
      name_string = name_string + name[:name] + ' & '
    elsif i == (names.length - 1)
      name_string = name_string + name[:name]
    else
      name_string = name_string + name[:name] + ', '
    end
  end
  name_string
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

A938W

def list names
  simpsons = names.map { |nameObject| nameObject[:name] }
  
  if simpsons.length == 1 
    return simpsons.first
  elsif simpsons.length == 0
    return ''
  end
  
  last = simpsons.pop
  simpsons.join(", ") + " & " + last
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

xieliming2017

def list(names)
  # TODO
  case names.length
      when 0
          ""
      when 1
          names[0][:name]
      when 2
          "#{names[0][:name]} & #{names[1][:name]}"
      else
          names1 = names[0..names.length-3]
          names2 = names[names.length-2..names.length-1]
          str1 = ""
          str2 = "#{names2[0][:name]} & #{names[names.length-1][:name]}"
          
          names1.each do |name|
              str1 = str1 + name[:name] + ", "
          end
          
          return "#{str1}#{str2}"
    end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

shxxu0212

def list names
  nombres = []
  names.each do |hash|
  nombres << hash.values
  end
  nombres = nombres.flatten
  
  # names.each_with_index do |x, idx|
  # lost_names << x[:idx]
  # end
  
  if nombres.length == 0
  return ""
  elsif nombres.length == 1
  return nombres[0]
  elsif nombres.length == 2
  return "#{nombres[0]} & #{nombres[1]}"
  end
  
  return "#{nombres[0..-3].join(', ')}, #{nombres[-2]} & #{nombres[-1]}"
  
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

nessamichelle

def list names
  characters = []

names.each_with_index do |x, idx|
  characters << x[:name] 
end
  
  if characters.length == 1
    return characters[0]
  elsif characters.length == 2 
    return "#{characters[0]} & #{characters[1]}"
  elsif characters.length > 2
    return "#{characters[0..-3].join(', ')}, #{characters[-2]} & #{characters[-1]}"
  end
return ""
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

mateuscruz

def list names
  names.map(&:values).flatten.join(", ").reverse.sub(" ,", " & ").reverse
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

martinklotzman

def list names

name_list = names.map {|value| value[:name]}

  if name_list.length == 0
     return ""
  elsif name_list.length == 1
    return name_list.join('')
  else
    return name_list[0..-2].join(", ") + " & " + name_list[-1]
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

trungnn142

def list names
  str_formatted = names.map {|name| name[:name]}.join(", ")
  last_index_commas = str_formatted.rindex(",")
  str_formatted[last_index_commas] = " &" if last_index_commas
  str_formatted
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

mhnguyen289


def list names

str = []
 name = names.map do |d| 
 str.push(d[:name])  
end

if str.length == 0
  ""
elsif str.length == 1
  str[0]
elsif str.length == 2
    str.join(' & ')
else
  s = str[0...-1].join(', ')
    s + ' & ' + str.last
  end
  
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

aamarill

def list names
  
  output = ""
  number_of_names = names.size

  if number_of_names < 1
    return ""
    elsif number_of_names == 1
    return "#{names[0][:name]}"
  end
  
   i = 0
  
  while i < (number_of_names - 2) && number_of_names > 2 do
    output << "#{names[i][:name]}, "
    i += 1
  end

  output << "#{names[-2][:name]} & #{names[-1][:name]}"
  

end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

GeorgeWhiting

def list names
  array = names.map do |name|
    name[:name]
  end
  array.join(', ').reverse.sub(',','& ').reverse
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Mnargh

def list names
  array = names.map {|name| name[:name]}.join(", ").reverse.sub(",", "& ").reverse
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

iainelder

def list names
  return "" if names.length == 0
  just_names = names.map { |x| x[:name] }
  return just_names[0] if names.length == 1
  just_names[0..-2].join(", ") + " & #{just_names[-1]}"
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

edilsonh

def list names
  g = ""
  names.each_with_index do |x, i|
     g += x[:name]
    if i == (names.length - 2)
      g += " & "
    elsif i != (names.length - 1) 
      g += ", "
    end
  end
  g
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

A938W

def list names
    simpsons = []
  
  names.each do |nameObject|
    simpsons << nameObject[:name]
  end
  
  
  if simpsons.length == 1
    return simpsons.first
  end
  
  if simpsons.length == 0
    return ''
  end
  
  
  last = simpsons.pop()
  
  
  simpsons.join(", ") + " & " + last
  
  
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

adamisntdead

def list names
  if names.length == 0
    return ""
  elsif names.length == 1
    return names[0][:name]
  elsif names.length == 2
    return names[0][:name] + " & " + list(names[1..names.length])
  else 
    return names[0][:name] + ", " + list(names[1..names.length])
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

samofcorinth

def list(names)
  names = names.map do |name| name[:name] end
  if names.length >= 2
    return "#{names[0, names.length-1].join(', ')} & #{names[-1]}"
  else
    return names.join
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

redstarking

def list names
   str = []
   names.each { |n| str <<  n[:name] }
   str.join(", ").reverse.sub(',', '& ').reverse
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

tomosjohnrees1234

def list(names)
  case names.count
  when 0
    ""
  when 1
    names.first[:name]
  else
    "#{names.shift(names.count - 1).map { |n| n[:name] }.join(", ") } & #{names.last[:name]}"
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Brandan-Hummell

def list names
  n = names.length
  if (n == 1)
    return names[0][:name]
  elsif (n == 2)
    return "#{names[0][:name]} & #{names[1][:name]}"
  else
    name_string = ""
    names.each_with_index do |name, index|
      if (index == (n - 1))
        name_string += name[:name]
      elsif (index == (n - 2))
        name_string += "#{name[:name]} & "
      else
        name_string += "#{name[:name]}, "
      end
    end
    return name_string
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

aka-rob

def list names
  if names.length == 0
    return ""
  end
  
  result = Array.new
  
  names.each do |name|
    if names.index(name) == (names.length - 2)
      result << name[:name] + ' & '
    elsif names.index(name) == (names.length - 1)
      result << name[:name]
    else
      result << name[:name] + ', '
    end
  end
  
  return result.join
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

nilay-patel044

def list(names) #define a function list that takes a hashmap called names.
  if names.nil? || names.empty? #if the hashmap is empty or nil, then return empty string.
    return ''
  elsif names.size == 1 # if the hashmap is of size 1, then map it into an array and return the first element.
    names = names.map { |name| name[:name]}
    return names[0]
  else
   names = names.map { |name| name[:name] } #otherwise, still map the values into a names array.
    "#{names[0...-1].join(', ')} & #{names.last}" #and explicitly return a formatted string of names separated by a comma and space except the last two, which are separated by &.
  end  
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

Meepit

def list names
  formatted_names = ""
  if names.length == 0
    return formatted_names
  end
  if names.length == 1
    return formatted_names += names[0][:name]
  else
    names[0..names.length-2].each{|i| formatted_names += "#{i[:name]}, "}
  end
  return formatted_names[0..-3] + " & #{names[-1][:name]}"
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

stevenPeniche

def list(hash_array)
  name_array = []
  
  hash_array.each_with_index do |hash, index| 
    name_array << hash[:name]
  end
  
  if name_array.length > 2 
    name_array.push(name_array.pop(2).join " & ").join ", "
  else
    name_array.join " & "
  end
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

HuyNT

def list names
  # TODO
  return '' if names.length == 0
  arr_names = names.map{|name| name[:name]}
  return arr_names.first if arr_names.length == 1
  arr_names[0..arr_names.length-2].join(", ") << " & #{arr_names.last}" 
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

mdavis93

def list names
  output = ""
  
  names.each_with_index do |name, index|
    if (names.size - index > 2)
      output += name[:name] + ", "
    elsif (names.size - index == 2)
      output += name[:name] + " & "
    else
      output += name[:name]
    end
  end
    output
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

russellschmidt

def list names
  return '' if names.length == 0
  return names.first[:name] if names.length == 1
  main = names.map!{|n| n[:name]}.last(2).join(" & ")
  return names.length > 2 ? names.slice(0, names.length - 2).join(", ") + ", " + main : main
end

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link

sssbb19

def list names
  case names.length
  when 0 
    return ""
  when 1 
    return names[0][:name]
  when 2
    return "#{names[0][:name]} & #{names[1][:name]}"
  when 3 
    return "#{names[0][:name]}, #{names[1][:name]} & #{names[2][:name]}"
  else
    str = "#{names[0][:name]}, "
    names[1..names.length - 3].each do |el|
      str += "#{el[:name]}, "
    end 
    str += "#{names[-2][:name]} & #{names[-1][:name]}"
    return str
  end 
end 

        Best Practices0
        Clever0
    0
    Fork
    Compare with your solution
    Link