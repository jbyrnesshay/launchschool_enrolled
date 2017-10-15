question 1:

1
2
2
3
numbers is not mutated by .uniq

question 2
1. != 'not equal conditional operator'
use in a conditional to test of a not equal 
a != b
2. !user_name tests if if user_name 'not' truthy
3. words.uniq! is a method which mutates the caller
4. ?something,   error but is the ternary operator ?: for if else
5. something?, error 
6. !!user_name tests if user_name truthy (negates !)
thereby turning object into its boolean equivalent

question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!('important', 'urgent')

question 4
String#delete(1) deletes the value 1
returns that value

String#delete_at(2) deletes the vale at index 2
returnsthe value

question 5
(10..100).include? 42

question 6
famous_words = "seven years ago..."
famous_words.prepend("four score and")
famous_words.insert(0, 'four score and')
"four score and " << famous_words

question 7
42

question 8
flintstones.flatten!

question 9
flintstones.assoc("Barney")