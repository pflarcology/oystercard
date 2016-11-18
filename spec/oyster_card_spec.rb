
require 'oyster_card'

describe Oystercard do
  subject(:oyster) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

    context "new card" do
      it 'should have a default balance' do
        expect(oyster.balance).to eq 0
      end
    end


    context "topping up" do

      it 'should add money to the card' do
        oyster.top_up(10)
        expect(oyster.balance).to eq 10
      end

      it 'should have a maximum balance of £90' do
        oyster.top_up(described_class::MAXIMUM_BALANCE)
        expect{ oyster.top_up(1) }.to raise_error "Card cannot be loaded over £#{described_class::MAXIMUM_BALANCE}."
      end

      it 'should not be able to top up over £90' do
        expect{ oyster.top_up(100) }.to raise_error "Card cannot be loaded over £#{described_class::MAXIMUM_BALANCE}."
      end

    end


    context "deducting fares" do

      it 'should deduct money from the card' do
        oyster.top_up(15)
        oyster.deduct(10)
        expect(oyster.balance).to eq 5
      end

    end


    context "touching in" do

      it 'should raise an error when the balance is below the minimum' do
        expect{ oyster.touch_in(entry_station) }.to raise_error "Card cannot be touched in: below £#{described_class::MINIMUM_BALANCE}"
      end

    end

    context "checks after a full journey" do

      before do
        oyster.top_up(described_class::MAXIMUM_BALANCE)
        oyster.touch_in(entry_station)
        oyster.touch_out(exit_station)
      end

    end


end
