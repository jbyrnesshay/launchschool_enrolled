
# my solution
def triple_double(num1,num2)
  nums_1, nums_2 = num1.to_s.chars, num2.to_s.chars
  straight_triple = nums_1.select.with_index {|num, i|  [nums_1[i+1], nums_1[i+2]].all? {|test| num == test} }
  matched_double = nums_2.select.with_index {|num, i| straight_triple.any? {|test| num == test} && num == nums_2[i+1] } 
  straight_triple.any? && matched_double.any? ? 1 : 0
end

#other solutions


    Show Me:
    All Solutions
    Solutions of Users I am Following
    My Solutions

    Sort By:
    Best Practices
    Clever
    Newest
    Oldest

    c0nspiracy

    def triple_double(num1, num2)
      num1.to_s.scan(/(.)\1\1/).any? { |n| /#{n}{2}/ === num2.to_s } ? 1 : 0
    end

            Best Practices16
            Clever21
        4
        Fork
        Compare with your solution
        Link
    ReganRyanNZ

    def triple_double(num1,num2)
      num1 = num1.to_s
      num2 = num2.to_s
      10.times do |i|
        if num1.include?(i.to_s*3) && num2.include?(i.to_s*2)
          return 1
        end
      end
      return 0
    end

            Best Practices11
            Clever18
        1
        Fork
        Compare with your solution
        Link
    nick.strohl

    def triple_double(num1,num2)
      (0..9).each { |i| return 1 if num1.to_s.include?(i.to_s*3) && num2.to_s.include?(i.to_s*2) }
      0
    end

            Best Practices7
            Clever3
        0
        Fork
        Compare with your solution
        Link
    usasnouski

    def triple_double(num1,num2)
      check_triple(num1) && check_double(num2) ? 1 : 0
    end

    def check_triple(num1)
      num1.to_s.match(/(.)\1{2,}/)
    end

    def check_double(num2)
      num2.to_s.match(/(.)\1{1,}/)
    end

            Best Practices2
            Clever0
        0
        Fork
        Compare with your solution
        Link
    10XL

    def triple_double(num1,num2)
      "#{num1}-#{num2}".scan(/(\d)\1\1\d*-\d*\1\1/).count
    end

            Best Practices1
            Clever1
        0
        Fork
        Compare with your solution
        Link
    bryanlo22, Iron Fingers

    def triple_double(num1, num2)
      /(\d)\1\1/ === num1.to_s && /(\d)\1/ === num2.to_s ? 1 : 0
    end

    1 similar code variation is grouped with this one
    Show Variations
            Best Practices1
            Clever0
        1
        Fork
        Compare with your solution
        Link
    Matsamoto

    def triple_double(num1,num2)
      "#{num1} #{num2}" =~ /(\d)\1\1\d* \d*\1\1/ ? 1 : 0
    end

            Best Practices1
            Clever1
        0
        Fork
        Compare with your solution
        Link
    margarita2

    def triple_double(num1,num2)
      str1 = num1.to_s
      str2 = num2.to_s
      if str1.include?("000") && str2.include?("00")
        return 1
      elsif str1.include?("111") && str2.include?("11")
        return 1
      elsif str1.include?("222") && str2.include?("22")
        return 1
      elsif str1.include?("333") && str2.include?("33")
        return 1
      elsif str1.include?("444") && str2.include?("44")
        return 1
      elsif str1.include?("555") && str2.include?("55")
        return 1
      elsif str1.include?("666") && str2.include?("66")
        return 1
      elsif str1.include?("777") && str2.include?("77")
        return 1
      elsif str1.include?("888") && str2.include?("88")
        return 1
      elsif str1.include?("999") && str2.include?("99")
        return 1
      else return 0
      end
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    brad72287

    def triple_double(num1,num2)
      [*0..9].each do |i|
        double=i.to_s*2
        triple=i.to_s*3
        return 1 if num1.to_s[triple] && num2.to_s[double]
      end
      return 0
    end

            Best Practices0
            Clever1
        0
        Fork
        Compare with your solution
        Link
    glowt

    def triple_double(num1,num2)
      l = lambda{ |x,arr| arr.to_s.chars.each_cons(x).to_a.map{|e| e.uniq if e.uniq.size == 1}.compact }
      (l.call(3,num1) & l.call(2,num2)).size > 0 ? 1 : 0
    end

            Best Practices0
            Clever1
        0
        Fork
        Compare with your solution
        Link
    maxiappleton

    def triple_double(num1,num2)
      (0..9).each do |dig|
        return 1 if num1.to_s =~ /#{dig}{3}/ && num2.to_s =~ /#{dig}{2}/
      end
      0
    end

            Best Practices0
            Clever1
        0
        Fork
        Compare with your solution
        Link
    lambda4fun

    def triple_double(num1,num2)
      (num1.to_s =~ /(\d)\1\1/ and num2.to_s.include?($1*2)) ? 1 : 0
    end

            Best Practices0
            Clever2
        0
        Fork
        Compare with your solution
        Link
    hoovercj

    def triple_double(num1,num2)
      #your code here
        (0..9).to_a.select { |n| num1.to_s =~ /#{n}{3}/ && num2.to_s =~ /#{n}{2}/ }.length
    end

            Best Practices0
            Clever2
        0
        Fork
        Compare with your solution
        Link
    JamesAwesome

    def triples(num)
      num = num.to_s
      num.chars.uniq.select { |x| num.include?(x + x + x) }
    end

    def doubles(num)
      num = num.to_s
      num.chars.uniq.select { |x| num.include?(x + x) }
    end


    def triple_double(num1,num2)
      common_triples = triples(num1) & doubles(num2)
      return 1 if common_triples.length > 0
      0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    ml_dalos

    def triple_double(num1,num2)
      #your code here
      (num1.to_s + ' ' + num2.to_s).match(/(.)\1\1.*\s.*\1\1/) ? 1 : 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    ProgrammingSam

    def triple_double(num1,num2)
      num1 = num1.to_s.split("")
      num2 = num2.to_s.split("")
      
      triple = 0
      double = 0
      
      num1.each_with_index do |x,n|
          if (x == num1[n+1]) and (x == num1[n+2])
            triple = 1
            break
          else
            triple = 0
          end
      end
      
      num2.each_with_index do |x,n|
          if x == num2[n+1]
            double = 1
            break
          else
            double = 0
          end
      end  
        
      if triple == 1 and double == 1
        return 1
      else 
        return 0
      end  
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    Tamenze

    def triple_double(num1,num2)
      #your code here
      num1 = num1.to_i 
      tripleFlag = false
      doubleFlag = false
      tripleDouble = 0
      watchNum = 0
      
      arr1 = num1.to_s.split("")
      arr1.each_with_index{|char,index|
        if (char == arr1[index+1]) && (char == arr1[index+2])
          tripleFlag = true
          watchNum = arr1[index..(index+1)].join
        end
      }
      
      #now, just check if arr2 contains watchNum
      arr2 = num2.to_s
      if arr2.include? watchNum.to_s
        doubleFlag = true
      end

      tripleFlag && doubleFlag ? tripleDouble = 1 : tripleDouble = 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    Firefly2002

    def triple_double(num1,num2)
      string_1 = num1.to_s 
      string_2 = num2.to_s
      
      char = string_1.chars.detect { |num| string_1.match("#{num}{3}") } || -1
      
      string_2.match("#{char}{2}") ? 1 : 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    JohnnyNiu

    def triple_double(num1,num2)
      (num1.to_s.scan /(\d)\1{2}/).any?{|n| /#{n}{2}/ === num2.to_s} ? 1:0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    JohnnyNiu

    def triple_double(num1,num2)
      ((num1.to_s.scan /(.)\1{2}/ ) & (num2.to_s.scan /(.)\1{1}/)).empty? ? 0:1
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    umairb1

    def triple_double(num1,num2)
      (0..20).each{|x| return 1 if num1.to_s.include?(x.to_s*3) && num2.to_s.include?(x.to_s*2) }
      0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    markfranciose

    def triple_double(num1,num2)
      arr_1 = num1.to_s.split("")
      arr_2 = num2.to_s.split("")
      arr_1_streak = false
      arr_2_streak = false
      index = 0
      streak_num = 1
      arr_1.each do |num|
        if arr_1[index] == arr_1[index + 1] && arr_1[index] == arr_1[index + 2]
          streak_num = arr_1[index]
          arr_1_streak = true
          break
        end
        index += 1
      end
      index = 0
      arr_2.each do |num|
        if arr_2[index] == streak_num && arr_2[index] == arr_2[index + 1]
          arr_2_streak = true
        end
        index += 1
      end
      return 1 if arr_1_streak && arr_2_streak 
      0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    jgradim

    def triple_double(num1, num2)
      t1 = num1.to_s.scan(/(\d)\1\1/).flatten
      t2 = num2.to_s.scan(/(\d)\1/).flatten
      (t1 & t2).size > 0 ? 1 : 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    rveneracion

    def triple_double(num1,num2)
      triple = num1.to_s.split('').select{|x| num1.to_s.include? ([x] * 3).join('')}
      double = num2.to_s.split('').select{|x| (num2.to_s.include? ([x] * 2).join('')) and triple.include? x }
      if triple.length > 0 and double.length > 0
        return 1
      end
      return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    bah87

    def triples(num)
      arr = num.to_s.chars
      trips = []
      idx = 0
      
      while idx < arr.length-2
        a = arr[idx..idx+2]
        trips << arr[idx].to_i if a.uniq[0] == a[0] && a.uniq[0] == a[1] && a.uniq[0] == a[2]
        
        idx += 1 
      end
      
      trips
    end

    def doubles(num)
      arr = num.to_s.chars
      dubs = []
      idx = 0
      
      while idx < arr.length-1
        a = arr[idx..idx+1]
        dubs << arr[idx].to_i if a.uniq[0] == a[0] && a.uniq[0] == a[1]
        
        idx += 1 
      end
      
      dubs
    end

    def triple_double(num1,num2)
      trips = triples(num1)
      dubs = doubles(num2)
      
      trips.each do |el| 
        return 1 if dubs.include?(el)
      end 
      
      return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    jfeng702

    def triple_double(num1,num2)
      triplets = []
      num1.to_s.chars.each_with_index {|e,i| triplets << e if e == num1.to_s[i+1] && num1.to_s[i+1] == num1.to_s[i+2]}
      triplets.uniq!
      
      num2.to_s.chars.each_with_index {|e,i| return 1 if triplets.include?(e) && num2.to_s[i+1] == e}
      return 0
      
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    jcmckay

    def triple_double(num1,num2)
      ary1 = num1.to_s.chars.map(&:to_i)
      ary2 = num2.to_s.chars.map(&:to_i)
      
      first = false
      second = false

      ary1.each_with_index { |n,i| 
        if ary1[i-1] == n && n == ary1[i+1] 
          first = true 
          break
        end
      }
      
        ary2.each_with_index { |n,i| 
        if n == ary2[i+1] 
          second = true 
          break
        end
      }
      
      return 1 if first && second
      return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    Zion_w

    def triple_double(num1,num2)
      #your code here
      num1 = num1.to_s
      num2 = num2.to_s
      
      10.times do |i| 
        return 1 if num1.include?(i.to_s*3) && num2.include?(i.to_s*2)
      end
      0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    uanka

    def triple_double(num1,num2)
      s_num1 = num1.to_s
      s_num2 = num2.to_s
      for i in (0..9)
        if s_num1.match(Regexp.new(i.to_s+'{3}'))
          return 1 if s_num2.match(Regexp.new(i.to_s+'{2}'))
        end
      end
      return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    rvkrish

    def triple_double(num1,num2)
      num1.to_s.split("").uniq.each { |e| 
      return 1 if (num1.to_s.include?(e*3) && num2.to_s.include?(e*2)) 
      }
      return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    rvkrish

    def triple_double(num1,num2)
      hash_triple = {}
      hash_double = {}
      element = num1.to_s.split("").first
      num1.to_s.split("").each{|e|
       if element == e
         hash_triple[e]||=0
         hash_triple[e]+=1
       else
         hash_triple[element] = 0 if  hash_triple[element] && hash_triple[element] < 3
         element = e
         hash_triple[e]||=0
         hash_triple[e]+=1
       end
     } 
     element = num2.to_s.split("").first
     num2.to_s.split("").each{|e|
     if hash_triple[e] && hash_triple[e] >= 3 && element == e
        hash_double[e]||=0
        hash_double[e]+=1
    else
        hash_double[element] = 0 if  hash_double[element] && hash_double[element] < 2
        element = e
        hash_double[e]||=0
        hash_double[e]+=1
    end
     }
     hash_double.each{|k,v|
       if v>=2
         return 1
       end
     }
     return 0
      #your code here
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    ryanm1234

    def triple_double(num1,num2)
      num1_triples = num1.to_s
                         .split('')
                         .each_cons(3)
                         .select { |(n1, n2, n3)| n1 == n2 && n2 == n3 }
                         .map { |(n1,_,_)| n1 }
      exists = num2.to_s
                   .split('')
                   .each_cons(2)
                   .any? { |(n1, n2)| n1 == n2 && num1_triples.include?(n1) }
      exists ? 1 : 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    KeoniGarner

    def triple_double(num1,num2)
      loopCount = 0
      
      numberArray1 = num1.to_s.split('')
      
      while loopCount < numberArray1.size - 2
        if numberArray1[loopCount].to_i == numberArray1[loopCount + 1].to_i && numberArray1[loopCount].to_i == numberArray1[loopCount + 2].to_i
          loopCount2 = 0
          
          numberArray2 = num2.to_s.split('')
      
          while loopCount2 < numberArray2.size - 1
            if numberArray1[loopCount].to_i == numberArray2[loopCount2].to_i && numberArray1[loopCount].to_i == numberArray2[loopCount2 + 1].to_i
              return 1
            end
            loopCount2+=1
          end
        end
        loopCount+=1
      end
        return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    ryanmease

    def triple_double(num1, num2)
      triples = get_triples(num1)
      doubles = get_doubles(num2)

      (triples & doubles).empty? ? 0 : 1
    end

    def get_triples(num)
      digits = num.to_s.chars.map(&:to_i)
      triples = []
      digits.each_index do |i|
        if digits[i] == digits[i + 1] && digits[i] == digits[i + 2]
          triples << digits[i]
        end
      end
      triples.uniq
    end

    def get_doubles(num)
      digits = num.to_s.chars.map(&:to_i)
      doubles = []
      digits.each_index do |i|
        if digits[i] == digits[i + 1]
          doubles << digits[i]
        end
      end
      doubles.uniq
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    lnfinity

    def triple_double(num1,num2)
      i1 = 2
      num1 = num1.to_s
      num2 = num2.to_s
      while i1<num1.length
        if num1[i1]==num1[i1-1] && num1[i1]==num1[i1-2]
          i2=1
          while i2<num2.length
            if num2[i2]==num1[i1] && num2[i2]==num2[i2-1]
              return 1
            end
            i2+=1
          end
        end
        i1+=1
      end
      return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    hzfanfei

    def getByCount(num, c)
      s = num.to_s
      w = s.length
      return -1 if w < c
      n = w - c + 1
      result = []
      for i in 0..n-1
        same = s[i]
        right = true
        for j in 1..(c-1)
          right = false if s[i+j] != same
        end
        result.push(same) if right == true && result.index(same) == nil
      end
      return result
    end

    def triple_double(num1,num2)
      r1 = getByCount(num1, 3)
      return 0 if r1 == -1
      r2 = getByCount(num2, 2)
      return 0 if r2 == -1
      r1.each do |i|
        r2.each do |j|
          return 1 if i == j
        end
      end
      return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    xwu5300

    def triple_double(num1,num2)
      num1 = num1.to_s.chars.chunk{ |x| x }.map(&:last).select{ |x| x.count > 2 }.flatten.uniq
      num2 = num2.to_s.chars.chunk{ |x| x }.map(&:last).select{ |x| x.count > 1 }.flatten.uniq
      (num1 & num2).empty? ? 0 : 1
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    bagdenia

    def triple_double(num1,num2)
      num1.to_s.scan(/(.)\1{2}/).flatten.map{ |e| 
           num2.to_s.include?(e*2) ?  1 : 0 }.include?(1) ? 1 : 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    bertshin




    def triple_double(num1,num2)
      
      array1 = num1.to_s.split('')
      array2 = num2.to_s.split('')
      conditional1 = false
      conitional2 = false
      idx = 0
      while idx < array1.length - 2
        
        if array1[idx] == array1[idx+1] && array1[idx] == array1[idx+2]
          conditional1 = true
        end
        idx += 1
      end
      
      idx = 0
      while idx < array2.length - 1
        
        if array2[idx] == array2[idx+1]
          conditional2 = true
        end
        idx += 1
      end
      
      if conditional1 == true && conditional2 == true
        return 1
      else
        return 0
      end
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    ttillotson

    def triple_double(num1,num2)
      #your code here
      idx1 = 0 
      idx2 = 0
      n1 = num1.to_s
      n2 = num2.to_s
      while idx1 < n1.length
        if n1[idx1] == n1[idx1 + 1] && n1[idx1] == n1[idx1 + 2] #&& n1[idx1] == n1[idx1 + 1]
          while idx2 < n2.length 
            if n2[idx2] == n2[idx2 + 1] #&& n2[idx2] == n2[idx2 + 1]
              return 1
            end
            idx2+=1
          end
        end
        idx1+=1
        end
      return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    Kaoxyooj

    def triple_double(num1,num2)
      a = to_array(num1).each_with_index.map{|x,i| x == to_array(num1)[i+1] && x == to_array(num1)[i+2] ? x.to_i : nil }.compact
      b = to_array(num2).each_with_index.map{|x,i| x == to_array(num2)[i+1] ? x.to_i : nil }.compact
      a.any? && (b.any? && b.include?(a[0]) ) ? 1 : 0
    end

    def to_array(num)
       num.to_s.split('')
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    sansae

    def triple_double(num1,num2)
      num1_arr = num1.to_s.split("")
      num2_arr = num2.to_s.split("")

      count = 1
      num1_arr.each_with_index {|arr1_num, idx|
        arr1_current_num = arr1_num
        if arr1_current_num == num1_arr[idx + 1]
          count += 1
          if count == 3
            count = 1
            num2_arr.each_with_index {|arr2_num, idx|
              if arr1_current_num == arr2_num
                arr2_current_num = arr2_num
                if arr2_current_num == num2_arr[idx + 1]
                  count += 1
                  return 1 if count == 2
                end
              end
            }
            count = 1
          end
        end
      }
      0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    guest_ysgy4edkxw8

    def triple_double(num1,num2)
      num1_arr = num1.to_s.split("")
      num2_arr = num2.to_s.split("")

      count = 1
      num1_arr.each_with_index {|arr1_num, idx|
        arr1_current_num = arr1_num
        if arr1_current_num == num1_arr[idx + 1]
          count += 1
          if count == 3
            count = 1
            num2_arr.each_with_index {|arr2_num, idx|
              if arr1_current_num == arr2_num
                arr2_current_num = arr2_num
                if arr2_current_num == num2_arr[idx + 1]
                  count += 1
                  if count == 2
                    return 1
                  end
                end
              end
            }
            count = 1
          end
        else
          count = 1
        end
      }
      0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    sansae

    def triple_double(num1,num2)
      num1_arr = num1.to_s.split("")
      num2_arr = num2.to_s.split("")

      count = 1
      num1_arr.each_with_index {|arr1_num, idx|
        arr1_current_num = arr1_num
        if arr1_current_num == num1_arr[idx + 1] #check if arr1_current_num appears 3x consecutively in num1_arr
          count += 1
          if count == 3
            count = 1
            num2_arr.each_with_index {|arr2_num, idx|
              if arr1_current_num == arr2_num
                arr2_current_num = arr2_num
                if arr2_current_num == num2_arr[idx + 1]#check if arr1_current_num appears 2x consecutively in num2_arr
                  count += 1
                  if count == 2
                    return 1
                  end
                end
              end
            }
            count = 1
          end
        end
      }
      0
    end
    # triple_double(81666112292143632577482921, 5226611445918775358735020889)#expects 1
    triple_double(87666589021297460965097560001930, 6967009410805864239)#expects 1

    # triple_double(451999277, 41177722899)#, 1)
    # triple_double(1222345, 12345)#, 0)
    # triple_double(12345, 12345)#, 0)
    # triple_double(666789, 12345667)#, 1)
    # triple_double(10560002, 100)#, 1)

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    codewick

    def triple_double(num1,num2)
      #your code here
      arr1 = num1.to_s.scan(/./)
      arr2 = num2.to_s.scan(/./)
      i = 0
      x = 0
      j = 0
      while i < arr1.length do
        if arr1[i] == arr1[i+1] and  arr1[i+1] == arr1[i+2]
          x = arr1[i]
          while j < arr2.length do
            if arr2[j] == x and arr2[j] == arr2[j+1]
               r = 1
            end
            j = j + 1
          end
        end
        i = i + 1
      end
      if r == 1
        return 1
      else
        return 0
      end
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    Simbidion

    def triple_double(num1,num2)
    array = num1.to_s.chars
    array2 = num2.to_s.chars

    n = 0
    triple_array = []
    array.each do |number|
      if number == array[n+1] && number == array[n+2]
          triple_array << number
      end 
      n = n+1
    end

    double_array = []
    n1 = 0
    array2.each do |number|
      if number == array2[n1+1]
          double_array << number
      end 
      n1 = n1+1
    end

    answer = 0

    triple_array.each do |number|
       if double_array.include?(number)
          answer = 1
       else
          answer = 0
       end
    end
    answer
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    chloejin525

    def triple_double(num1,num2)
      return 0 if check_repeat(num1.to_s, 3, []) == []
      res = check_repeat(num2.to_s, 2, check_repeat(num1.to_s, 3, []))
      return 1 if res && res!=[]
      return 0
    end

    # write a function to check different patterns
    def check_repeat(str, time, pattern)
      count = 0
      if pattern == [] 
        last = '0'
        str.each_char do |c| 
          c == last ? (count+=1) : (count=0)
          last = c 
          if count==time-1
            pattern << c 
            count = 0
          end 
        end
        return pattern
      else 
        pattern.each do |p|
          str.each_char do |c|
            c == p ? (count+=1) : (count=0)
            return true if count == time  
          end
        end
      end
      return false 
    end 

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    chloejin525

    def triple_double(num1,num2)
      return 1 if two(num2.to_s, three(num1.to_s))
      return 0
    end

    def three(str)
      count = 1
      last = '0' 
      pattern = []
      str.each_char do |c| 
        c == last ? (count+=1) : (count=1)
        last = c 
        if count==3
          pattern << c 
          count = 1
        end 
      end
      pattern 
    end

    def two(str, pattern)
      count = 0 
      pattern.each do |p|
        str.each_char do |c|
          c == p ? (count+=1) : (count=0)
          return true if count == 2 
        end
      end
      return false 
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    ebf916

    def triple_double(num1,num2)
      
      doubles = []
      (0...(num2.to_s.length - 1)).each do |i|
        if num2.to_s[i] == num2.to_s[i + 1]
          doubles << num2.to_s[i]
        end
      end
      
      (0...(num1.to_s.length - 2)).each do |i|
        return 1 if (num1.to_s[i] == num1.to_s[i + 1]) && (num1.to_s[i] == num1.to_s[i + 2]) && (doubles.include?(num1.to_s[i]))
      end
      
    return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    sarabilmeswd2017

    def triple_double(num1,num2)
      num1_string = num1.to_s
      num2_string = num2.to_s
      if (num1_string.include? "000") && (num2_string.include? "00")
        p 1
      elsif (num1_string.include? "111") && (num2_string.include? "11")
        p 1
      elsif (num1_string.include? "222") && (num2_string.include? "22")
        p 1
      elsif (num1_string.include? "333") && (num2_string.include? "33")
        p 1
      elsif (num1_string.include? "444") && (num2_string.include? "44")
        p 1
      elsif (num1_string.include? "555") && (num2_string.include? "55")
        p 1
      elsif (num1_string.include? "666") && (num2_string.include? "66")
        p 1
      elsif (num1_string.include? "777") && (num2_string.include? "77")
        p 1
      elsif (num1_string.include? "888") && (num2_string.include? "88")
        p 1
      elsif (num1_string.include? "999") && (num2_string.include? "99")
        p 1
      else 
        p 0
      end
      
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    paulaburke

    def triple_double(num1,num2)
      results = 0
      num1_arr = num1.to_s.split(//)
      num2_arr = num2.to_s.split(//)
      
      num1_arr.each_with_index do |n, i|
        if (i+2) <= num1_arr.length
          if n == num1_arr[i+1] and n == num1_arr[i+2]
            num2_arr.each_with_index do |m, i|
              if (i+1) <= num2_arr.length
                if m == n and m == num2_arr[i+1]
                  results = 1
                end
              end
            end
          end
        end
      end
      results
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    hlaaftana

    def triple_double(num1,num2)
      (0..9).find_all { |x| num1.to_s.include?(x.to_s * 3) }
        .any? { |x| num2.to_s.include?(x.to_s * 2) } ? 1 : 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    wongkx

    def triple_double(num1,num2)
      num1Array = num1.to_s.chars.map(&:to_i)
      num2Array = num2.to_s.chars.map(&:to_i)
      straight = nil
      num1Array.each_with_index { |v,i| straight = v if num1Array[i+1] == num1Array[i] && num1Array[i+2] == num1Array[i] }
      num2Array.each_with_index do |v,i|  
        if (num2Array[i] == straight && num2Array[i+1] == straight) 
          return 1 
        end
      end
      return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    michal8888

    def triple_double(num1,num2)
      numbers = num1.to_s.scan(/(\d)\1\1/)
      return 0 if numbers.empty?
      numbers.flatten!.map! { |i| num2.to_s.scan(/#{i}{2}/) }
      numbers.flatten.empty? ? 0 : 1
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    ajkchang

    def triple_double(num1,num2)
      def triple?(num)
        num_arr = num.to_s.split("")
        num_arr.each_with_index do |int, idx|
          unless num_arr[idx + 1] == nil || num_arr[idx + 2] == nil
            return true if (num_arr[idx - 1] == num_arr[idx] && num_arr[idx] == num_arr[idx + 1]) && ((num_arr[idx -2] && num_arr[idx + 2]) != num_arr[idx])
          end    
        end
      false
      end
      
      def double?(num)
      num_arr = num.to_s.split("")
        num_arr.each_with_index do |int, idx|
          unless (num_arr[idx + 1] == nil && num_arr[idx + 2] == nil) 
            return true if ((num_arr[idx - 1] != num_arr[idx]) && (num_arr[idx + 1] == num_arr[idx]) && (num_arr[idx + 2] != num_arr[idx])) 
          end
        end
      false
      end
      
      if triple?(num1) == true && double?(num2) == true
        result = 1
      else
        result = 0
      end
    result
      
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    quochien

    def triple_double(num1,num2)
      return 0 unless num1.to_s.chars.each_cons(3).map { |a,b,c| (a==b) && (a==c) }.include?(true)
      return 0 unless num2.to_s.chars.each_cons(2).map { |a,b| a==b }.include?(true)
      
      1
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    MartinQc

    def triple_double(num1,num2)
      "#{num1} #{num2}" =~ /(\d)\1\1.* .*\1\1/ ? 1 : 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    mirceal

    def triple_double(num1,num2)
      ('0'..'9').each do |s|
        return 1 if num1.to_s.include?(s*3) && num2.to_s.include?(s*2)
      end
      return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    peiyush13

    def triple_double(num1,num2)
     arr=[]
     num1.to_s.chars.each_cons(3){|num| arr.push(num[1..2].join('')) if num[0]==num[1]&& num[1]==num[2] }
     num2.to_s.chars.each_cons(2){ |num| return 1 if arr.include?(num.join(''))}
     return 0
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link
    ihmoda

    def triple_double(num1,num2)
      triple = false
      double = false
      start_index = nil
      
      num1array = num1.to_s.split("")
      num2array = num2.to_s.split("")
      
      num1array.each_with_index do |num, idx|
        
        if idx > num1array.length - 2
        elsif num1array[idx] == num1array[idx+1] && num1array[idx+1] == num1array[idx+2]
          triple = true
        end
        
      end
      
      num2array.each_with_index do |num, idx|
          
        if idx > num2array.length - 1
        elsif num2array[idx] == num2array[idx+1]
          double = true
        end
      
      end
        
      if triple == true && double == true
        return 1
      else
        return 0
      end
      
    end

            Best Practices0
            Clever0
        0
        Fork
        Compare with your solution
        Link




