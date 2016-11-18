require 'journey_log'

describe JourneyLog do

# it { is_expected.to respond_to(:new).with(4).argument }
subject(:journeylog) { described_class.new }
let(:station) { double :station }

  context 'testing journey log' do

    # it 'should record entry station' do
    #   journeylog.start_journey(station)
    #   expect(subject.journeys).to include station
    # end

    it 'should record exit station' do
      journeylog.finish_journey(station)
      expect(subject.journeys).to include station
    end

  end


end
