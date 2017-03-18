
class Airport

  DEFAULT_CAPACITY = 20
  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport is full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take off: weather is stormy' if stormy?
    raise 'Cannot take off plane: plane not at this airport' unless at_airport?(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

end
