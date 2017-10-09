

a = [4,5,6]


class Array

  def thing
    test = yield self
    fafa = []
    test = test.each do |i|
     fafa.push(i * 2)
   
     #test[test.index(i)].replace(i*2)
    end
    fafa
  end
end


puts a.thing {|x| x}


