require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#initialization' do

    it 'starts wihth a balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  describe '#top_up' do

    it 'should increase the balance by the amount entered' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end


end
