require 'oystercard'

describe OysterCard do
  subject(:oystercard) {described_class.new}
  let(:station) {double :station}

  it { is_expected.to(respond_to(:balance))}
  it { is_expected.to(respond_to(:top_up).with(1).argument) }
  it { is_expected.to(respond_to(:in_journey?))}
  it { is_expected.to(respond_to(:touch_in).with(1).argument) }

  describe 'initialize' do

    it 'check new card has balance 0' do
      expect(subject.balance).to eq(0)
    end

  end

  describe '#top_up' do
    it 'when top_up it changes the balance' do
      expect{subject.top_up(10)}.to change{subject.balance}.by 10
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = OysterCard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{subject.top_up(1)}.to raise_error "Max balance of £#{maximum_balance} exceeded"
    end
  end

  describe 'journey' do
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end

    it 'can touch in' do
      subject.top_up(50)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'stores the station entry' do
      subject.top_up(50)
      expect(subject.touch_in(station)).to eq(station)
    end

    it 'error if card has insufficient balance' do
      expect{subject.touch_in(station)}.to raise_error "Card has insufficient balance"
    end

    it 'can touch out' do
      subject.top_up(50)
      subject.touch_in(station)
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
    it 'when touch_out it deducts amount' do
      subject.top_up 50
      subject.touch_in(station)
      expect{subject.touch_out}.to change{subject.balance}.by(-OysterCard::MINIMUM_FARE)
    end
  end
end
