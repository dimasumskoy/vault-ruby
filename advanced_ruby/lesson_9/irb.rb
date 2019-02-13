current_line = 0
result = ''

loop do
  print "##{current_line += 1} >: "
  input = gets
  break if input.strip == 'exit'

  if input.strip == ''
    puts eval(result)
    result = ''
  else
    result += input
  end
end
