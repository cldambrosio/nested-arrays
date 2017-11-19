def find_depth(arr)
  arr_depth = []
  arr.each do |e|
    depth = 0
    while e.is_a? Array
      depth += 1
      e = e[0]    
    end
    arr_depth << depth
  end
  arr_depth
end

def to_single_nest(arr)
  strings = []
  arr.each do |e|
    if e.is_a? String
      strings << e
    else e.is_a? Array
      strings << e.flatten
    end
  end
  strings
end

def substitutions_num(arr1, arr2)
  if (find_depth(arr1) != find_depth(arr2)) || (arr1.join.length != arr2.join.length)
    return -1
  elsif arr1.join == arr2.join
    return 0
  else
    to_substitute = find_depth(arr1).map { |n| 2**n }
    strings = to_single_nest(arr1)
    strings2 = to_single_nest(arr2)
    strings.each_with_index do |word, i|
      if word == strings2[i]
        to_substitute[i] = 0
      else
        num = 0
        if word.is_a?(String)
          word.split('').each_with_index do |char, j|
            if char != strings2[i].split('')[j]
              num += 1
            end
          end
          to_substitute[i] = (to_substitute[i] * num)
        else word.is_a?(Array)
          word.join.split('').each_with_index do |char, j|
            if char != strings2[i].join.split('')[j]
              num += 1
            end
          end
          to_substitute[i] = (to_substitute[i] * num)
        end
      end
    end
    to_substitute.inject(:+)
  end
end