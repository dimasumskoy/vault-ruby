require 'spec_helper'

RSpec.describe Train do
  let!(:train) { Train.new('123') }
  let!(:wagon) { Wagon.new('1') }

  before { train.hook_wagon(wagon) }

  describe '#number' do
    it 'returns the number of the train' do
      expect(train.number).to eq '123'
    end
  end

  describe '#hook_wagon' do
    it 'hooks the wagon' do
      expect(train.wagons.count).to eq 1
      expect(train.wagons.include?(wagon)).to eq true
    end
  end

  describe '#unhook_wagon' do
    it 'unhooks the wagon' do
      train.unhook_wagon(wagon)

      expect(train.wagons.count).to eq 0
      expect(train.wagons.include?(wagon)).to eq false
    end
  end
end
