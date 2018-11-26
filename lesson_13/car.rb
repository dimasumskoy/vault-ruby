class Car
  INITIAL_RPM = 700

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

  private

  def start_engine!
    self.current_rpm = INITIAL_RPM
  end
end
