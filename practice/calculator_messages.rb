
class Message
  attr_reader :result, :name

  def initialize
    @message = {
      invalid_num: "hmm.. that doesn't look like a valid number",
      invalid_name: "Make sure to use a valid name",
      invalid_op: "Must choose 1,2,3, or 4",
      try_again?: "Do you want to perform another calculation
        (Y to calculate again)",
      goodbye: "thank you for using the calculator.  goodbye",
      welcome: "Welcome to Calculator! Enter your name"
    }
  end

  def result=(result)
    @result = result
    @message[:result] = "The result is #{@result}"
  end

  def name=(name)
    @name = name
    @message[:hello] = "Hi #{@name}"
  end

=begin
  #this is the same as using attr_reader :name
  def name
    @name
  end
=end

  def invalid_num
    @message[:invalid_num]
  end

  def invalid_name
    @message[:invalid_name]
  end

  def invalid_op
    @message[:invalid_op]
  end

  def try_again?
    @message[:try_again?]
  end

  def goodbye
    @message[:goodbye]
  end

  def welcome
    @message[:welcome]
  end

  def hello
    @message[:hello]
  end
end

Messages = Message.new
