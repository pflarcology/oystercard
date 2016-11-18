
require 'station'
describe Station do

  subject {described_class.new("Aldgate East", 1)}

  context 'testing initialization' do

    it 'should respond to calling its name' do
      expect(subject.name).to eq("Aldgate East")
    end

    it 'should respond to zone' do
      expect(subject.zone).to eq 1
    end

  end

end
