10.times { |n| puts "Value of n is now #{n}" }

puts '###'

(1..10).each { |n| puts "Value of n is now #{n}" }

puts '###'

(1..10).each.with_index do |n, i|
  puts "Value of n is now #{n} and index is #{i}"
end
