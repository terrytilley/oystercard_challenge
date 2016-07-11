require 'oystercard'

describe Oystercard do

  describe 'initialize' do
    subject(:card) {described_class.new}

    it 'check new card has balance 0' do
      expect(subject.balance).to eq(0)
    end

  end

end
