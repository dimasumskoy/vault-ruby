class Train
  attr_reader :number, :wagons

  def initialize(number)
    @number = number
    @wagons = []
  end

  def hook_wagon(wagon)
    @wagons << wagon
  end

  def unhook_wagon(wagon)
    @wagons.delete(wagon)
  end
end
