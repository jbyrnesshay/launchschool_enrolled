
fun = 55
list = 0..25
=begin
class Integer
  def puts
    Proc.new {|n| puts n }
  end
end
=end
list.each { |num| puts num }
#list.each(&:puts)
