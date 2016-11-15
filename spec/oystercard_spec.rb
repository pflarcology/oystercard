require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#initialization' do

    it 'starts with a balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'starts off not on a journey' do
      expect(subject.in_journey).to eq false
    end

  end



  describe '#in_journey?' do

    it { is_expected.to respond_to :in_journey }

  end
# missing test
  describe '#touch_in' do

    it 'should make the card in use' do
      subject.touch_in
      expect(subject.in_journey).to eq true
    end

  end

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

  describe '#deduct' do

    it 'should reduce the balance by the amount entered' do
      subject.top_up 1
      expect{ subject.deduct 1 }.to change{ subject.balance }.by -1
    end

  end



end
