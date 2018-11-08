def make_coffee(blend = '')
  puts 'Мелим кофе...'
  yield(blend) if block_given?
  puts 'Готово!'
end

make_coffee

puts '###'

make_coffee('Arabica') { |b| puts "Магия приготовления кофе (#{b})..." }
