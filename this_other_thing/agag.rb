 =begin
  def sequence_sum(begin_number, end_number, step)
    return 0 if (begin_number <=> end_number) * step > 0
    to
    (begin_number..end_number).to_a.inject do |sum, num|
      if (num - begin_number) % step == 0
       sum + num 
      else
        sum + 0
      end
  end
=end 