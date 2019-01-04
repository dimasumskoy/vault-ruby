require_relative 'instance_counter'

class Car
  include InstanceCounter

  attr_accessor :current_rpm

  def self.debugger(log)
    puts "!!! DEBUG: #{log} !!!"
  end

  debugger 'Start interface'

  def initialize
    @current_rpm = 0
    register_instance
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    self.current_rpm.zero?
  end

  debugger 'End interface'

  protected

  def initial_rpm
    700
  end

  def start_engine!
    self.current_rpm = initial_rpm
  end
end
