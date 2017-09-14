require 'byebug'

# time complexity is n^2
def bad_two_sum?(arr, target)
  arr.each_with_index do |el, idx|
    arr.each_with_index do |el2, idx2|
      next if idx == idx2
      return true if target == (el + el2)
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) #
def okay_two_sum?(arr, target)
  arr.length.times do
    first = arr.shift
    desired = target - first
    idx = bsearch(arr, desired)
    return true if idx
  end
  false
end

def bsearch(arr, target)

  midpoint = arr.length/2
  midvalue = arr[midpoint]
  # debugger
  return midpoint if midvalue == target
  return nil if arr.length <= 1

  left = arr[0...midpoint]
  right = arr[(midpoint + 1)..-1]

  if midvalue > target
    bsearch(left, target)
  else
    value = bsearch(right, target)
    if value != nil
      value += midpoint + 1
    end
  end
end

# p bsearch([1,2,3,5,7], 3)
p okay_two_sum?([1,2,3,4,5,7], 10)
