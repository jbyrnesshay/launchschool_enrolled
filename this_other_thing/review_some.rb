    Sort By:
    Best Practices
    Clever
    Newest
    Oldest

    mortonfox, SebastienPires, loris-fo, diabolik, maxipombo, Pablex (plus 22 more warriors)

    def unique_in_order(iterable)
      (iterable.is_a?(String) ? iterable.chars : iterable).chunk { |x| x }.map(&:first)
    end

    24 similar code variations are grouped with this one
    Show Variations
            Best Practices47
            Clever152
        11
        1
        Fork
        Compare with your solution
        Link
    glonnon, Samellenrider

    def unique_in_order(iterable)
      it_array= []
      iterable.length.times do |x|
        it_array << iterable[x] if iterable[x] != iterable[x+1]
      end
      it_array
    end

    1 similar code variation is grouped with this one
    Show Variations
            Best Practices19
            Clever12
        0
        Fork
        Compare with your solution
        Link
    Shramp

    def unique_in_order(iterable)
      iterable = iterable.chars if iterable.is_a?(String)
      answer = []
      iterable.each do |el|
        answer << el if answer.last != el
      end
      answer
    end

            Best Practices7
            Clever0
        1
        Fork
        Compare with your solution
        Link
    juanca

    def unique_in_order(iterable)
      iterable.length.times.reduce([]) do |uniqued, i| 
        uniqued.push iterable[i] unless uniqued.last == iterable[i]
        uniqued
      end
    end

            Best Practices4
            Clever4
        0
        Fork
        Compare with your solution
        Link
    ScientificProgressGoesBoing

    def unique_in_order(iterable)
      case iterable
        when String
          iterable.gsub(/(.)\1*/, '\1').split('')
        when Array
          iterable.uniq
      end
    end

            Best Practices3
            Clever3
        2
        Fork
        Compare with your solution
        Link
    Nick5l

    def unique_in_order(iterable)
      result = []
      for idx in 0...iterable.length
        result << iterable[idx] unless result.last == iterable[idx] || iterable[idx].nil?
      end 
      result 
    end

            Best Practices1
            Clever0
        0
        Fork
        Compare with your solution
        Link
    vetalpaprotsky

    def unique_in_order(iterable)
      result = []
      method = iterable.is_a?(String) ? :each_char : :each
      iterable.send(method) { |x| result << x if result.last != x }
      result
    end

            Best Practices1
            Clever3
        0
        Fork
        Compare with your solution
        Link
    dorachin

    def unique_in_order(iterable)
      iterable.is_a?(String) ? (iterable = iterable.chars) : iterable
      
      unique = []
      iterable.each do |element|
        unique << element if unique.last != element
      end
      unique
    end

            Best Practices1
            Clever0
        0
        Fork
        Compare with your solution
        Link
    DipAch21

    def unique_in_order(iterable)
      return iterable.split(/(\w)\1*/).reject { |e| e.empty? } if iterable.is_a? String
      return iterable.chunk { |e| e }.map &:first if iterable.is_a? Array
    end

            Best Practices1
            Clever0
        0
        Fork
        Compare with your solution
        Link
    howardmann

    def unique_in_order(iterable)
      def chomp(str)
        str.scan(/((\w)\2*)/).map{|el| el[1]}
      end

      if iterable.is_a?(String)
        chomp(iterable)
      elsif iterable.all? {|e| e.is_a?(Integer) }
        chomp(iterable.join('')).map{|e| e.to_i}
      else
        chomp(iterable.join(''))
      end
    end