require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  describe '#initialization' do

    it 'starts with a balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'starts off not on a journey' do
      expect(subject.in_journey?).to eq false
    end

  end

  describe '#in_journey' do

    it { is_expected.to respond_to :in_journey? }

  end

  describe '#entry_station' do

    it { is_expected.to respond_to :entry_station }

  end

  describe '#exit_station' do

    it { is_expected.to respond_to :exit_station }

  end

  describe '#journeys' do

    it { is_expected.to respond_to :journeys }

  end


  describe '#touch_in' do
    it 'should raise an error when the balance is below the minimun amount' do
      error = "Cannot touch in: less than £#{described_class::MINIMUM_FARE} on card"
      expect{ subject.touch_in(entry_station) }.to raise_error error
    end
  end

  describe '#top_up' do

    it 'should increase the balance by the amount entered' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it "raises an error if top up amount takes balanace above limit" do
      subject.top_up described_class::LIMIT
      error = "Top up amount takes balance above £#{described_class::LIMIT} limit"
      expect{ subject.top_up 1 }.to raise_error error
    end

  end

  context 'card is topped up' do

    before do
      subject.top_up(described_class::LIMIT)
      subject.touch_in(entry_station)
    end

    describe '#touch_in' do

      it 'stores the entry station' do
        expect(subject.entry_station).to eq entry_station
      end

      it 'should make the card in use' do
        expect(subject.in_journey?).to eq true
      end

      it 'should make exit station equal nil' do
        subject.touch_out(exit_station)
        subject.touch_in(entry_station)
        expect(subject.exit_station).to eq nil
      end

    end

    describe '#touch_out' do


      it 'should make the card not in use' do
        subject.touch_out(exit_station)
        expect(subject.in_journey?).to eq false
      end

      it 'deducts the minimum fare from the card' do
        expect{ subject.touch_out(exit_station) }.to change {subject.balance }.by -1
      end

      it 'sets the entry station to nil' do
        subject.touch_out(exit_station)
        expect(subject.entry_station).to eq nil
      end

      it 'stores the exit station' do
        subject.touch_out(exit_station)
        expect(subject.exit_station).to eq exit_station
      end


    end

  end

end
