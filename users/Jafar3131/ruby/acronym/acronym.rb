# frozen_string_literal: true

# Write your code for the 'Acronym' exercise in this file. Make the tests in
# `acronym_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/acronym` directory.
# or w.chars.first

class Acronym
  def self.abbreviate(string)
    require "pry"
    binding.pry

    abbreviation = ""
    string.scan(/\w+/) { |w| abbreviation += w[0] }
    abbreviation.upcase
  end
end

p Acronym.abbreviate("Fara Mara, Cara - Saynara, tap-,lara")
