def my_min_I(list)
  list.each_with_index do |el1, idx1|
    min_length = true
    list.each_with_index do |el2, idx2|
      next if idx1 == idx2
      min_length = false if el2 < el1
    end
    return el1 if min_length == true
  end
end

def my_min_II(list)
  min = list.first
  list.each do |el|
    if el < min
      min = el
    end
  end
  min
end

def largest_contiguous_subsum(list)

  subarray = []
  list.each_with_index do |el, idx|
    list.each_with_index do |el2, idx2|
      next if idx2 < idx
      subarray << list[idx..idx2]
    end
  end

  max_arr = subarray[0]
  max = subarray[0].reduce(:+)

  subarray.each do |sub_arr|
    if sub_arr.reduce(:+) > max
      max_arr = sub_arr
      max = sub_arr.reduce(:+)
    end
  end

  max
end

def better_largest_contiguous_subsum(list)
  sum = 0
  best_sum = 0
  list.each do |el|
    if sum + el > 0
      sum += el
      if sum > best_sum
        best_sum = sum
      end
    else
      sum = 0
    end
  end

  best_sum
end

p better_largest_contiguous_subsum([2, 3, -6, 7, -6, 7])
