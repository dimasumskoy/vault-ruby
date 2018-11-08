# Assistant

puts 'What is you name?'
name = gets.chomp.capitalize

def start_conversation(name = nil)
  return if name.nil?

  greet_user(name)
  request = take_request
  give_response(request)

  puts 'Bye!'
end

def greet_user(name)
  puts "Hi, #{name}!"
end

def take_request
  puts 'What would you like to ask?'
  gets.chomp
end

def give_response(request)
  puts "You've asked about #{request}"
end

start_conversation(name)
