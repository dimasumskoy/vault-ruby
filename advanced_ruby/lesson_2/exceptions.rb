begin
  puts 'Before exception'
  raise
  puts 'After exception'
rescue StandardError => e
  puts "!!! Exception: #{e.message}"
  puts 'You cannot do that!'
  retry
end

puts 'After exception'
