

=begin
 For example, given the map of words:

words = {
  life:   %w{ vida vie Leben },
  death:  %w{ muerte mort Tode }
}

The method should return the result:

 {
  life: [
    ['Leben'],
    ['Leben', 'vida'],
    ['Leben', 'vida', 'vie'],
    ['Leben', 'vie'],
    ['vida'],
    ['vida', 'vie'],
    ['vie']
  ],
  death: [
    ['Tode'],
    ['Tode', 'mort'],
    ['Tode', 'mort', 'muerte'],
    ['Tode', 'muerte'],
    ['mort'],
    ['mort', 'muerte'],
    ['muerte']
  ]
}
=end


# Accepts a hash of words to an array of translations.
# Returns a hash of words mapped to an array of all possible combinations of translations.
 # for a hashmap of words,
 # uterate through each word & values
def possibilities(words)
  result = {}
 
  words.each do |k,v|
    result[k]=[]
    values = []
    v.each.with_index do |value, x|
      values << value
      p value
      result[k][x] = values
      val
      
      
      
    end

   
  end
  result
end
words = {
  life:   %w{ vida vie Leben }#,
  #death:  %w{ muerte mort Tode }
}
p possibilities(words)
 


