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

    # Ignore numbers greater than 1000
    nums.reject! { |n| n > 1000 }

    # Check for negative numbers
    negative_numbers = nums.select { |n| n < 0 }

    if negative_numbers.any?
      raise "negative numbers not allowed: #{negative_numbers.join(', ')}"
    end

    nums.sum
  end

  private

  def self.parse_custom_delimiter(numbers)
    header, body = numbers.split("\n", 2)

    raise "Invalid format: missing newline after delimiter" unless body

    delimiter = header[2..-1]

    [ delimiter, body ]
  end
end
