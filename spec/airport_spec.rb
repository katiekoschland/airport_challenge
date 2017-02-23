# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed


require 'airport'

describe Airport do
  it 'instructs a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

end
