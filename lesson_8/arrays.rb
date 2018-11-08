def flat(array)
  new_arr = []

  array.each do |arr|
    arr.each { |n| new_arr << n }
  end

  p new_arr
end

array = [[:a, 1], [:b, 2], [:c, 3]]

flat(array)
