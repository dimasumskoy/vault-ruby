puts 'Your height?'
height = gets.chomp.to_f

puts 'Your weight?'
weight = gets.chomp.to_f

index = weight / ((height /= 100) ** 2)

if index < 18.5
  puts 'Eat more!'
elsif (18.5..24.9).include?(index)
  puts 'Keep it up!'
else
  puts 'Eat less!'
end
