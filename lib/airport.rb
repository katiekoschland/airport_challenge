
class Airport

  def initialize(capacity)
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
  end

private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
  Weather.new.stormy?
  end

end
