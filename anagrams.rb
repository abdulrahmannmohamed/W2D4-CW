def anagram?(str1, str2)
  permutations(str1.split('')).join.include?(str2)
end

def permutations(array)
  return [array] if array.length == 1

  first  = array.shift
  perms = permutations(array)

  total_perms = []

  perms.each do |perm|
    (0..perm.length).each do |idx|
      total_perms << perm[0...idx] + [first] + perm[idx..-1]
    end
  end
  total_perms
end

def second_anagram?(str1, str2)
  arr1 = str1.split("")
  arr2 = str2.split("")

  idx1 = 0
  while idx1 < arr1.length

    idx2 = 0
    while idx2 < arr2.length
      if arr1[idx1] == arr2[idx2]
        arr1.delete_at(idx1)
        arr2.delete_at(idx2)
        idx1 -= 1
        idx2 -= 1
      end

      idx2 += 1
    end

    idx1 += 1
  end

  return true if arr1.empty? && arr2.empty?
  false
end

def merge_sort(arr)
  return arr if arr.length == 1

  midpoint = arr.length / 2

  sorted_left = merge_sort(arr.take(midpoint))
  sorted_right = merge_sort(arr.drop(midpoint))

  merge(sorted_left, sorted_right)
end

def merge(left, right)

  merged = []

  until left.empty? || right.empty?
    case left.first <=> right.first
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

  merged.concat(left)
  merged.concat(right)

  merged
end

def third_anagram?(str1, str2)
  merge_sort(str1.split('')) == merge_sort(str2.split(''))
end

def fourth_anagram?(str1, str2)
  hsh = Hash.new { |hash, key| hash[key] = 0}

  str1.split('').each do |letter|
    hsh[letter] += 1
  end

  str2.split('').each do |letter|
    hsh[letter] -= 1
  end

  hsh.each do |k, v|
    if v != 0
      return false
    end
  end

  true
end

p fourth_anagram?("apples", "seppla")
