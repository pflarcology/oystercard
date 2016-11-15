require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#initialization' do

    it 'starts wihth a balance of 0' do
      expect(subject.balance).to eq 0
    end
  end


end
