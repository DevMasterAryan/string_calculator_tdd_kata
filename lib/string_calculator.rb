# frozen_string_literal: true

##
# StringCalculator implements a simple calculator for string-based numeric input.
# It supports various delimiters, handles empty strings, and validates against negative numbers.
#
# This class follows TDD principles and demonstrates clean code practices.
#
# @example Basic usage
#   calculator = StringCalculator.new
#   calculator.add("")        #=> 0
#   calculator.add("1")       #=> 1
#   calculator.add("1,2")     #=> 3
#   calculator.add("1\n2,3")  #=> 6
#   calculator.add("//;\n1;2") #=> 3
#
# @author TDD Kata Implementation
# @since 1.0.0
class StringCalculator
  ##
  # Adds numbers from a string input with various delimiter support.
  #
  # @param numbers [String] A string containing numbers separated by delimiters
  # @return [Integer] The sum of all numbers in the input string
  # @raise [ArgumentError] When negative numbers are present in the input
  #
  # @example Empty string
  #   add("") #=> 0
  #
  # @example Single number
  #   add("5") #=> 5
  #
  # @example Comma-separated numbers
  #   add("1,2,3") #=> 6
  #
  # @example Mixed delimiters (comma and newline)
  #   add("1\n2,3") #=> 6
  #
  # @example Custom delimiter
  #   add("//;\n1;2;3") #=> 6
  #
  # @example Negative numbers (raises exception)
  #   add("1,-2,3") #=> raises ArgumentError: "negative numbers not allowed: -2"
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, number_string = parse_delimiter_and_numbers(numbers)
    number_array = split_numbers(number_string, delimiter)

    validate_no_negatives(number_array)

    number_array.sum
  end

  private

  ##
  # Parses the input string to extract custom delimiter and number string.
  #
  # @param numbers [String] The input string that may contain delimiter specification
  # @return [Array<String>] An array containing [delimiter, number_string]
  #
  # @example With custom delimiter
  #   parse_delimiter_and_numbers("//;\n1;2") #=> [";", "1;2"]
  #
  # @example Without custom delimiter
  #   parse_delimiter_and_numbers("1,2,3") #=> [",", "1,2,3"]
  def parse_delimiter_and_numbers(numbers)
    if numbers.start_with?("//")
      delimiter_line, number_string = numbers.split("\n", 2)
      delimiter = delimiter_line[2..] # Remove '//' prefix
      [delimiter, number_string]
    else
      [",", numbers]
    end
  end

  ##
  # Splits the number string using the specified delimiter and converts to integers.
  # Also normalizes newlines to use the current delimiter for consistent parsing.
  #
  # @param number_string [String] The string containing numbers
  # @param delimiter [String] The delimiter to use for splitting
  # @return [Array<Integer>] Array of integers parsed from the string
  #
  # @example With comma delimiter
  #   split_numbers("1,2,3", ",") #=> [1, 2, 3]
  #
  # @example With newlines normalized
  #   split_numbers("1\n2,3", ",") #=> [1, 2, 3]
  def split_numbers(number_string, delimiter)
    # Replace newlines with the current delimiter for consistent parsing
    normalized_string = number_string.gsub("\n", delimiter)

    normalized_string.split(delimiter).map(&:to_i)
  end

  ##
  # Validates that no negative numbers are present in the array.
  #
  # @param numbers [Array<Integer>] Array of integers to validate
  # @raise [ArgumentError] When negative numbers are found
  # @return [void]
  #
  # @example With no negative numbers
  #   validate_no_negatives([1, 2, 3]) #=> returns normally
  #
  # @example With negative numbers
  #   validate_no_negatives([1, -2, 3, -4])
  #   #=> raises ArgumentError: "negative numbers not allowed: -2, -4"
  def validate_no_negatives(numbers)
    negatives = numbers.select(&:negative?)

    return if negatives.empty?

    raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}"
  end
end
