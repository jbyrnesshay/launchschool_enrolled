def short_long_short(string1, string2)
  if string1.length > string2.length
    long = string1
    short = string2
  else 
    long = string2
    short = string1
  end
  short + long + short
end




puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"


def short_long_short2(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end