require 'oystercard'
require 'journey'

describe Journey do
  subject(:journey) {described_class.new}

  it 'is initially not in a journey' do
    allow(journey).to receive(:in_journey?).and_return(false)
    expect(journey).not_to be_in_journey
  end

  it 'journey started' do
    expect(journey.start_station("station")).to eq(@start_station = "station")
  end

  it 'journey ended' do
    expect(journey.end_station("station")).to eq(@end_station = "station")
  end

end
