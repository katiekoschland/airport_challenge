require 'plane'

describe Plane do

  it 'so planes land at airports, instructs a plane to land' do
    airport = Airport.new(20)
    plane = Plane.new
    expect{ airport.land(plane) }.not_to raise_error
  end

  it 'so planes take off from airports, instruct a plane to take off' do
    airport = Airport.new(20)
    plane = Plane.new
    expect{ airport.take_off(plane) }.not_to raise_error
  end

end
