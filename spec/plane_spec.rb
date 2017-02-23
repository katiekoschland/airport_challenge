require 'plane'

describe Plane do

  it 'so planes land at airports, instructs a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect{ airport.land(plane).not_to raise_error}
  end


end
