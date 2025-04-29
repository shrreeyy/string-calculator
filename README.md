# String Calculator

https://github.com/user-attachments/assets/34560f2c-4d44-4992-b580-334490a214ed

## Overview
A simple Ruby-based String Calculator that parses and sums numbers from strings with support for custom delimiters, newlines, and input validation.

## Features

### Empty String Handling

```
Input: ""
Output: 0
Description: Returns 0 when the input string is empty or nil.
```

### Single Number

```
Input: "9"
Output: 9
Description: Returns the value of the single number in the string.
```

### Two Numbers

```
Input: "4,9"
Output: 13
Description: Parses and sums two numbers separated by a comma.
```

### Handling New Lines

```
Input: "3\n6,1"
Output: 10
Description: Supports both newlines and commas as delimiters.
```

### Custom Delimiters

```
Input: "//|\n2|5|3"
Output: 10
Description: Custom delimiter (|) defined using the format
```

### Negative Numbers

```
Input: "4,-3,-7"
Output: Exception - negative numbers not allowed: -3, -7
Description: Raises an error listing all negative numbers encountered.
```

### Ignoring Numbers Greater than 1000

```
Input: "1002,8,1200"
Output: 8
Description: Ignores numbers greater than 1000 when summing.
```

### Installation

1. Ensure Ruby is Installed:

You need Ruby installed on your system to run the String Calculator. You can check if Ruby is installed by running:

```
ruby -v
```

If Ruby is not installed, you can download and install it from https://www.ruby-lang.org/.

2. Clone the repository:

```
git clone https://github.com/shrreeyy/string-calculator 
```

3. Navigate into the project directory:

```
cd string-calculator
```

### Usage

Run the Tests:

1. To run the entire test suite:

```
rspec
```

2. To run specific test files:

```
rspec spec/lib/string_calculator_spec.rb

rspec spec/requests/calculators_controller_spec.rb
```

