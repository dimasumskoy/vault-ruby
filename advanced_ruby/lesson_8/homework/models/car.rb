class Car < ActiveRecord::Base
  attr_accessor :current_rpm

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    current_rpm.zero?
  end

  protected

  def initial_rpm
    700
  end

  def start_engine!
    current_rpm = initial_rpm
  end
end
