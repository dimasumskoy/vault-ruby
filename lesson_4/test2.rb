load 'module.rb'

class Assistant
  include Talkable

  def initialize(name)
    @name = name
  end

  def say_hello
    puts "Hello, #{@name}!"
  end

  def say_bye
    puts "Bye, #{@name}!"
  end
end

class String
  def to_i
    self.upcase
  end
end
