require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport is full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    plane.land(self)
    add_plane(plane)
  end

  def take_off(plane)
    raise 'Cannot take off: weather is stormy' if stormy?
    raise 'Cannot take off plane: plane not at this airport' unless at_airport?(plane)
    plane.take_off
    remove_plane(plane)
    plane
  end

  private

  attr_reader :capacity, :weather

  def full?
    planes.length >= capacity
  end

  def stormy?
    weather.stormy?
  end

  def at_airport?(plane)
    planes.include?(plane)
  end

  def add_plane(plane)
    planes << plane
  end

  def remove_plane(plane)
    planes.pop
  end

end
