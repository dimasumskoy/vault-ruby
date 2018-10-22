module Talkable
  def ask(something)
    case something.downcase
    when 'weather'
      puts 'The weather is fine!'
    when 'time'
      puts Time.now
    when 'day of week'
      puts Time.now.strftime("%A")
    else
      puts "Ooops"
    end
  end
end
