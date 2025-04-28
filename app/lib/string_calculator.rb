class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    # If there is no comma, return the number itself
    numbers.to_i unless numbers.include?(",")

    # Handle multiple numbers by splitting the string by commas
    nums = numbers.split(",").map(&:to_i)

    nums.sum
  end
end
