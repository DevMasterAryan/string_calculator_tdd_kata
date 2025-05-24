require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'with empty string' do
      it 'returns 0' do
        expect(calculator.add("")).to eq(0)
      end
    end

    context 'with single number' do
      it 'returns the number itself' do
        expect(calculator.add("1")).to eq(1)
        expect(calculator.add("5")).to eq(5)
      end
    end
    context 'with two numbers' do
      it 'returns the sum' do
        expect(calculator.add("1,2")).to eq(3)
        expect(calculator.add("1,5")).to eq(6)
      end
    end

    context 'with multiple numbers' do
      it 'returns the sum of all numbers' do
        expect(calculator.add("1,2,3")).to eq(6)
        expect(calculator.add("1,2,3,4,5")).to eq(15)
      end
    end
  end
end