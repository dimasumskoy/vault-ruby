RSpec.describe Calculator do
  describe '#sum' do
    it 'returns the sum of two arguments' do
      expect(subject.sum(5, 10)).to eq 15
    end
  end

  describe '#multiply' do
    it 'returns the multyplied arguments' do
      expect(subject.multiply(5, 10)).to eq 50
    end
  end

  describe '#factorial' do
    it 'returns the factorial of an argument' do
      expect(subject.factorial(5)).to eq 120
    end
  end

  describe '#sqrt' do
    it 'returns the factorial of an argument' do
      expect(subject.sqrt(9)).to eq 3
    end
  end
end
