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
  end
end
