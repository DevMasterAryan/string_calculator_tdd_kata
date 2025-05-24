# # String Calculator TDD Kata
#
# This is a Ruby implementation of the String Calculator TDD Kata, demonstrating 
# test-driven development practices.
#
# ## Setup
#
# 1. Install dependencies:
#    ```
#    bundle install
#    ```
#
# 2. Run tests:
#    ```
#    bundle exec rspec spec/string_calculator_spec.rb
#    ```
#
# ## Features Implemented
#
# - [x] Empty string returns 0
# - [x] Single number returns itself
# - [x] Two numbers return their sum
# - [x] Any amount of numbers
# - [x] Handle new lines between numbers
# - [x] Support different delimiters
# - [x] Negative number validation
#
# ## TDD Process
#
# Each feature was implemented following the Red-Green-Refactor cycle:
# 1. Write a failing test (RED)
# 2. Write minimal code to make it pass (GREEN)
# 3. Refactor for better design (REFACTOR)
#
# ## Usage
#
# ```ruby
# calculator = StringCalculator.new
# calculator.add("")        # => 0
# calculator.add("1")       # => 1
# calculator.add("1,2")     # => 3
# calculator.add("1\n2,3")  # => 6
# calculator.add("//;\n1;2") # => 3