require 'airport'

describe Airport do
  let(:airport) { described_class.new( weather, 20) }
  let(:plane) { double :plane}
  let(:weather) { double :weather}

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?). and_return false
      end

      it 'instructs a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'when full' do
        it 'raises an error' do
          20.times do
            airport.land(plane)
          end
          expect{ airport.land(plane) }.to raise_error 'Cannot land plane: airport is full'
        end
      end
    end

    context 'when stormy' do
      it 'raises an error ' do
        allow(weather).to receive(:stormy?).and_return true
        expect {airport.land(plane) }.to raise_error 'Cannot land plane: weather is stormy'
      end
    end
  end

  context 'default' do
    subject(:default_airport){ described_class.new(weather)}
    it 'has a default capacity' do

      allow(weather).to receive(:stormy?).and_return false
      described_class::DEFAULT_CAPACITY.times { default_airport.land(plane)}
        expect{ default_airport.land(plane)}.to raise_error 'Cannot land plane: airport is full'
      end
    end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'instructs a plane to take off' do
        airport.land(plane)
        expect(airport).to respond_to(:take_off).with(1).argument
      end

      it 'raises an error if plane is not at this airport' do
        other_airport = described_class.new(weather, 20)
        other_airport.land(plane)
        expect{ airport.take_off(plane) }.to raise_error 'Cannot take off plane: plane not at this airport'
      end
    end
  end

  context 'when stormy' do
    before do
      allow(weather).to receive(:stormy?).and_return true
    end

    it 'raises an error' do
      expect{ airport.take_off(plane) }.to raise_error 'Cannot take off: weather is stormy'
    end
  end
end
