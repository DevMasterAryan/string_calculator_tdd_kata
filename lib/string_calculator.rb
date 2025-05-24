class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, number_string = parse_delimiter_and_numbers(numbers)
    number_array = split_numbers(number_string, delimiter)
    number_array.sum
  end

  private

  def parse_delimiter_and_numbers(numbers)
    if numbers.start_with?('//')
      delimiter_line, number_string = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1]
      [delimiter, number_string]
    else
      [',', numbers]
    end
  end

  def split_numbers(number_string, delimiter)
    normalized_string = number_string.gsub("\n", delimiter)

    normalized_string.split(delimiter).map(&:to_i)
  end
end