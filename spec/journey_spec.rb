require './lib/journey.rb'

describe Journey do

subject(:journey) { described_class.new }
let(:station) {double :station}

  context "initalizing" do
   it "should have a entry station" do
     expect(journey).to respond_to(:entry_station)
   end

   it "should have an exit station" do
     expect(journey).to respond_to(:exit_station)
   end

   it "journeys should be an empty array" do
     expect(journey.journeys).to eq []
   end
  end

  context "fare" do
   it "should have a fare method" do
     expect(journey).to respond_to(:fare)
   end

   it "should return the minimum fare" do
     journey.entry_station = "Bank"
     expect(journey.fare).to eq 1
   end

   it "should return penalty fare if there is no entry station" do
     expect(journey.fare).to eq 6
   end
  end
end
