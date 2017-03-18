require 'plane'
require 'airport'
require 'weather'


describe Plane do
  let(:airport) { Airport.new(weather, 20) }
  let(:plane) { double :plane}
  let(:weather) { Weather.new }

  context 'when not stormy' do
    before do
      allow(weather).to receive(:stormy?). and_return false
    end

    it 'so planes land at airports, instructs a plane to land' do
      expect{ airport.land(plane) }.not_to raise_error
    end

    it 'so planes take off from airports, instruct a plane to take off' do
      airport.land(plane)
      expect{ airport.take_off(plane) }.not_to raise_error
    end
  end
end
