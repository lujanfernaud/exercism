=begin
Write your code for the 'Two Fer' exercise in this file. Make the tests in
`two_fer_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/two-fer` directory.
=end

class TwoFer
    def self.two_fer(x = "")
        if x.empty?
            "One for you, one for me."
        elsif x == "Alice"
            "One for #{x}, one for me."
        else x == "Bob"
            "One for #{x}, one for me."
        end
    end
end