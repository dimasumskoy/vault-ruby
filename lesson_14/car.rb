class Car
  attr_accessor :current_rpm

  def initialize
    @current_rpm = 0
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    self.current_rpm.zero?
  end

  protected

  def initial_rpm
    700
  end

  def start_engine!
    self.current_rpm = initial_rpm
  end
end

class Truck < Car
  def load
    # принять груз
  end

  protected

  def initial_rpm
    500
  end
end


class SportCar < Car
  def cabriolet
    # убрать крышу
  end

  def start_engine
    super
    puts 'Wrooom!'
  end

  protected

  def initial_rpm
    1000
  end
end
