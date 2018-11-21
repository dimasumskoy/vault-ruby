class Car
  CRUISE_SPEED = 60

  attr_accessor :speed

  attr_reader :engine_volume

  def initialize(number, engine_volume)
    @speed  = speed
    @number = number
    @engine_volume = engine_volume
    beep
  end

  def start_engine
    puts 'Wroom'
  end

  def beep
    puts 'Beep Beep'
  end

  def go
    @speed = 40
  end

  def stop
    @speed = 0
  end
end
