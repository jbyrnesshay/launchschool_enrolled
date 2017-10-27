
statement = "The Flintstones Rock"
def test_hsh(string)
  chars = string.scan(/\w/)
  #puts chars.inspect 
  my_hash = {}
  chars.each do |ltr|
    if my_hash[ltr] == nil
      my_hash[ltr] = 1
    else my_hash[ltr] += 1
    end
  end
  my_hash.sort.to_h
end

#puts test_hsh(statement)


def again_hsh(string)
  letters = ('A'..'Z').to_a + ('a'..'z').to_a
  hasher = {}
  letters.each { |ltr| hasher[ltr] = string.count(ltr) if string.count(ltr) > 0}
  hasher.sort.to_h
end

#puts again_hsh(statement)

def again2(statement)
  letters = ('A'..'Z').to_a + ('a'..'z').to_a
  hasher = {}
  letters.each do |ltr|
    frequency = statement.scan(ltr).count
    hasher[ltr] = frequency if frequency > 0
  end
  hasher
end
puts again2(statement)