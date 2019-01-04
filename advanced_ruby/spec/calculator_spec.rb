require 'spec_helper'

RSpec.describe Calculator do
  let!(:calculator) { Calculator.new }

  describe '#sum' do
    it 'returns the sum of arguments' do
      expect(calculator.sum(10, 5)).to eq 15
    end
  end

  describe '#multiply' do
    it 'returns the multyplied arguments' do
      expect(calculator.multiply(10, 5)).to eq 50
    end
  end

  describe '#factorial' do
    it 'returns the factorial of an argument' do
      expect(calculator.factorial(5)).to eq 120
    end
  end

  describe '#sqrt' do
    it 'returns the factorial of an argument' do
      expect(calculator.sqrt(9)).to eq 3
    end
  end
end
