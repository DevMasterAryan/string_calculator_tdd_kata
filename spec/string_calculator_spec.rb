# frozen_string_literal: true

require "rspec"
require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  let(:calculator) { described_class.new }

  describe "#add" do
    context "with empty string" do
      it "returns 0" do
        expect(calculator.add("")).to eq(0)
      end
    end

    context "with single number" do
      it "returns the number itself" do
        expect(calculator.add("1")).to eq(1)
        expect(calculator.add("5")).to eq(5)
      end
    end

    context "with two numbers" do
      it "returns the sum" do
        expect(calculator.add("1,2")).to eq(3)
        expect(calculator.add("1,5")).to eq(6)
      end
    end

    context "with multiple numbers" do
      it "returns the sum of all numbers" do
        expect(calculator.add("1,2,3")).to eq(6)
        expect(calculator.add("1,2,3,4,5")).to eq(15)
      end
    end

    context "with newlines between numbers" do
      it "handles newlines as delimiters" do
        expect(calculator.add("1\n2,3")).to eq(6)
        expect(calculator.add("1\n2\n3")).to eq(6)
      end
    end

    context "with custom delimiters" do
      it "handles semicolon delimiter" do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end

      it "handles pipe delimiter" do
        expect(calculator.add("//|\n1|2|3")).to eq(6)
      end

      it "handles asterisk delimiter" do
        expect(calculator.add("//*\n1*2*3")).to eq(6)
      end
    end

    context "with negative numbers" do
      it "throws exception for single negative number" do
        expect { calculator.add("-1") }.to raise_error(
          ArgumentError, "negative numbers not allowed: -1"
        )
      end

      it "throws exception for multiple negative numbers" do
        expect { calculator.add("1,-2,3,-4") }.to raise_error(
          ArgumentError, "negative numbers not allowed: -2, -4"
        )
      end

      it "throws exception with custom delimiter and negative numbers" do
        expect { calculator.add("//;\n1;-2;3;-4") }.to raise_error(
          ArgumentError, "negative numbers not allowed: -2, -4"
        )
      end
    end

    context "when zero in numbers this is edge cases" do
      it "handles zero values" do
        expect(calculator.add("0")).to eq(0)
        expect(calculator.add("0,0")).to eq(0)
        expect(calculator.add("1,0,2")).to eq(3)
      end

      it "handles large numbers" do
        expect(calculator.add("100,200,300")).to eq(600)
      end
    end
  end
end
