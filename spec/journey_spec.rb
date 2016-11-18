require 'journey.rb'
require 'oyster_card.rb'
#
describe Journey do
#
subject(:journey) { described_class.new }
let(:entry_station) {double :station}
let(:exit_station) {double :station }
let(:oyster) { double :oyster }

  context "initalizing" do
#    it "should have a entry station" do
#      expect(journey).to respond_to(:entry_station)
#    end
#
#    it "should have an exit station" do
#      expect(journey).to respond_to(:exit_station)
#    end

   it "journeys should be an empty hash" do
     expect(journey.journey).to eq Hash.new
   end
  end

  context '#journey' do

    it 'should include entry station' do
      journey.start_journey(entry_station)
      expect(journey.journey[:start]).to eq entry_station
    end
  end

    it 'should include exit station' do
      journey.end_journey(exit_station)
      expect(journey.journey[:end]).to eq exit_station
    end

  context "fare" do
   it "should have a fare method" do
     expect(journey).to respond_to(:fare)
   end
#
#    it "should return the minimum fare" do
#      journey.entry_station = "Bank"
#      journey.exit_station = "Aldgate"
#      expect(journey.fare).to eq described_class::MIN_FARE
#    end
#
#    it "should return penalty fare" do
#      expect(journey.fare).to eq described_class::PENALTY_FARE
#    end
#
#    it "should return penalty fare if no entry station" do
#      allow(journey).to receive(:entry_station).and_return(station)
#      expect(journey.fare).to eq described_class::PENALTY_FARE
#    end
#
#
#
 end
#
#
#  context "journey" do
#    it "should return false if there is no entry station" do
#      expect(journey.in_journey?).to eq false
#    end
#
#    it "should return true if there an entry station" do
#      allow(journey).to receive(:entry_station).and_return(station)
#      expect(journey.in_journey?).to eq true
#    end
#  end
#
#
# #  describe 'journey' do
# #    context "tests after touch in" do
# #      before do
# #        oyster = Oystercard.new
# #      end
# #
# #
# #     it 'should show true in_journey? after touching in' do
# #       oyster.top_up(10)
# #       oyster.touch_in("New Cross")
# #       expect(oyster.journey.in_journey?).to be true
# #     end
# #   end
# #
# # end
# #
#
#  #  context "tests after full journey" do
#  #
#  #    let(:oyster) { double :oyster }
#  #
#  #
#  #  #  it 'should show false when in_journey? after touching out' do
#  #  #    oyster = Oystercard.new
#  #  #    oyster.top_up(10)
#  #  #    oyster.touch_in("New Cross")
#  #  #    oyster.touch_out("Aldgate East")
#  #  #    expect(oyster.journey.in_journey?).to be false
#  #  #  end
#  #   #
#  #  #  it 'should return nil after touching out' do
#  #  #    oyster = Oystercard.new
#  #  #    oyster.top_up(10)
#  #  #    oyster.touch_in("New Cross")
#  #  #    oyster.touch_out("Aldgate East")
#  #  #    expect(oyster.journey.entry_station).to eq nil
#  #  #  end
#  #   #
#  #  #  it 'should record one journey' do

#  #  #    expect(oyster.journey.journeys).to eq [{ :entry_station => "New Cross", :exit_station => "Aldgate East"}]
#  #  #  end
#  #
#  # end
#
end
