def say_hello(name)
  puts "Hello, #{name}!"
end

def say_bye(name)
  puts "Bye, #{name}!"
end

def calculate(n)
  puts "Calculating..."
  yield(n) if block_given?
  puts "Done!"
end
