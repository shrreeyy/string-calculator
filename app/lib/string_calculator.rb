class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ","

    # Handle custom delimiter if present
    if numbers.start_with?("//")
      delimiter, numbers = parse_custom_delimiter(numbers)
    end

    # Replace newlines with the chosen delimiter
    numbers = numbers.gsub("\n", delimiter)

    # If there is no comma or newline, return the number itself
    return numbers.to_i unless numbers.include?(delimiter)

    # Handle multiple numbers by splitting the string by the delimiter
    nums = numbers.split(delimiter).map(&:to_i)

    nums.sum
  end

  private

  def self.parse_custom_delimiter(numbers)
    parts = numbers.split("\n", 2)
    delimiter = parts[0][2..-1]
    [ delimiter, parts[1] ]
  end
end
