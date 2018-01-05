    def solve(arr)
      vector = 0
      index = 0
      loop do |k, i|
      p arr[index] <=> arr[index + 1]
        vector += (arr[index] <=> arr[index + 1])
        index += 1
        break if index == arr.size - 1
      end
      if vector > 0
        (vector == (arr.size - 1)) ? 'D' : 'RD'
      elsif vector < 0
        (vector == -(arr.size - 1)) ? 'A' : 'RA'
      else 
        (arr[-2] <=> arr[-1]) == -1 ? 'RA' : 'RD'
      end
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    omegahm

    def solve(arr)
      return "A" if arr == arr.sort
      return "D" if arr == arr.sort.reverse
      arr.size.times { |i| return "RA" if arr.rotate(i) == arr.sort }
      arr.size.times { |i| return "RD" if arr.rotate(i) == arr.sort.reverse }
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    pbslavin

    def solve(arr)
      return "A" if arr.sort == arr
      return "D" if arr.sort.reverse == arr 
      arr_rot = arr.dup
      (arr.length - 1).times do
        arr_rot = arr_rot.rotate
        if arr_rot == arr.sort
          return "RA"
        elsif arr_rot == arr.sort.reverse 
          return "RD"
        end
      end
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    Unnamed

    def solve(arr)
      a, b, c = arr[0] < arr[1], arr[1] < arr[2], arr.last < arr.first
      m = a == b ? a : c
      (c == m ? 'R' : '') + (m ? 'A' : 'D')
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    KenKamau

    def solve(array)
      arry = Array.new(array)
      i = 0
      while i < arry.length-1 && arry[i] <= arry[i+1]
        i+=1
      end
      return "A" if i == arry.length - 1
      if i == 0 then
        while i < arry.length-1 && arry[i] >= arry[i+1]
          i += 1
        end
        return "D" if i == arry.length - 1
        if arry[0] < arry[i+1] then return "RD"
          else return "RA"
        end
      end

      if i < arry.length-1 && arry[0] > arry[i+1]
        return "RA"
      end
      return "RD"
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link

Invalid Solutions:

These solutions originally passed when they were submitted, however the kata's test cases have since been updated and these solutions now no longer pass.

    ZED.CWT

    def solve(q)
      p = q[0]
      l = r = 0
      for v in q.slice(1,q.length)
        p < v ? l += 1 : r += 1
        p = v
      end
      (0 < l && 0 < r ? 'R' : '') + (l < r ? 'D' : 'A')
    end