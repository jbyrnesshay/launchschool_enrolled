
=begin
Write a method that determines the mean (average) of the three scores passed to it, 
and returns the letter value associated with that grade.
Numerical Score Letter  Grade
90 <= score <= 100  'A'
80 <= score < 90  'B'
70 <= score < 80  'C'
60 <= score < 70  'D'
0 <= score < 60   'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.
=end



def get_grade(grade1, grade2, grade3)
  # 100/0.0 == infinity, ie, any division by 0 where either operand is float
  grades = {'A'=> (90..100/0.0), 'B'=> (80..89), 'C'=> (70..79), 'D'=> (60..69), 'F'=> (0..59)}
  # find key where block is true
  grades.keys.find {|value| grades[value].include? (grade1 + grade2 + grade3)/3 }
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(95, 90, 153) == "A"
