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

    it "raises an error if top up amount takes balanace above 90" do
      subject.top_up described_class::LIMIT
      error = "Top up amount takes balance above £#{described_class::LIMIT} limit"
      expect{ subject.top_up 1 }.to raise_error error
    end


  end


end
