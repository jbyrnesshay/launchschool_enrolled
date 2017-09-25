MESSAGES = {
              invalid_num: "hmm.. that doesn't look like a valid number",
              invalid_name: "Make sure to use a valid name",
              invalid_op: "Must choose 1,2,3, or 4",
              try_again?: "Do you want to perform another calculation
                (Y to calculate again)",
              goodbye: "thank you for using the calculator.  goodbye",
              welcome: "Welcome to Calculator! Enter your name"
            }

def name(name)
  MESSAGES[:hello] = "Hi #{name}"
end

def result(result)
  MESSAGES[:result] = "The result is #{result}"
end
 
