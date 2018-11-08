n = 1

while n <= 10 do
  puts "Value of n is now #{n}"
  n += 1
end

puts '###'

n = 1

until n > 10 do
  puts "Value of n is now #{n}"
  n += 1
end

puts '###'

for n in 1..10 do
  puts "Value of n is now #{n}"
end

puts '###'

n = 1

loop do
  break if n > 10

  puts "Value of n is now #{n}"
  n += 1
end
