require 'oystercard'

describe Oystercard do
  subject(:card) {described_class.new}
  
  describe 'initialize' do

    it 'check new card has balance 0' do
      expect(subject.balance).to eq(0)
    end

  end

  describe 'top_up' do

  end
end
