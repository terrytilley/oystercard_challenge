require 'journey'

describe Journey do
  subject(:journey) {Journey.new}

  it 'start journey' do
    expect(journey.start_journey("station")).to eq("station")
  end

end
