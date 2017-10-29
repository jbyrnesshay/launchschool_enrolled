Let's mix it up now with some variation. In the below example, we have an array of hashes, and we want to select all elements where every key matches the first letter of the value. Note that the keys are symbols here, so we'll have to do some conversion before comparison.

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

There's a lot going on here, but you now possess all the necessary knowledge to take this apart, line by line, letter by letter. We won't do a full table of steps like before, but see if you understand every line and every letter in the code above. If you do not, take your time and study it; you should be able to deconstruct this code to its core.