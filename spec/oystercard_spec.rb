require 'oystercard'

describe OysterCard do
  subject(:oystercard) {described_class.new}
  it { is_expected.to(respond_to(:balance))}
  it { is_expected.to(respond_to(:top_up).with(1).argument) }

  describe 'initialize' do

    it 'check new card has balance 0' do
      expect(subject.balance).to eq(0)
    end

  end

  describe 'top_up' do
    it 'when top_up it changes the balance' do
      expect{subject.top_up(10)}.to change{subject.balance}.by 10
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = OysterCard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{subject.top_up(1)}.to raise_error "Max balance of £#{maximum_balance} exceeded"
    end
  end
end
