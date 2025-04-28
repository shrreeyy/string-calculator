class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    numbers.to_i unless numbers.include?(",")
  end
end
