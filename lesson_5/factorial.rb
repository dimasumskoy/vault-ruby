puts 'Number?'
n = gets.chomp.to_f

p (1..n).inject(:*) || 1
