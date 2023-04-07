def my_is_sort(param_1)
  return true if param_1.empty? || param_1.length == 1

  ascending = descending = true
  for i in 0..(param_1.length - 2)
    ascending = false if param_1[i] > param_1[i + 1]
    descending = false if param_1[i] < param_1[i + 1]
  end

  ascending || descending
end
