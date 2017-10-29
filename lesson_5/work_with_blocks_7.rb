

[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1| # [[1], [2], [3], [4]]
  # [[1], [2], [3], [4]]
  # [['a', ['b'], ['c'], ['d']]
  element1.each do |element2|  # [1], [2], [3], [4]
    element2.partition do |element3| # 1, 2, 3, 4
      element3.size > 0
    end
  end
end
=begin
element1 = [[1], [2], [3], [4]][[1], [2], [3], [4]]
thing = []
element1.each do |element2|  # [1], [2], [3], [4]

 thing << element2.partition do |element3| # 1, 2, 3, 4
      element3.size > 0
    end
  end

puts thing.inspect

=end