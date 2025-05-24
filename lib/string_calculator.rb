class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    parse_number(numbers)
  end

  private

  def parse_number numbers
    numbers.split(',').map(&:to_i).sum
  end
end