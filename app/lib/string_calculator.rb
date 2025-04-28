class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    # If there is no comma, return the number itself
    numbers.to_i unless numbers.include?(",")

    # Handle multiple numbers by splitting the string by commas
    delimiter = ","

    # Replace newlines with commas
    numbers   = numbers.gsub("\n", delimiter)

    nums      = numbers.split(delimiter).map(&:to_i)

    nums.sum
  end
end
