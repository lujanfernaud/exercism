class Acronym
  def self.abbreviate(string)

    require 'pry'


    string.scan(/\b[a-zA-Z]/).map do |word|
      word.capitalize.chars.first
    end.join

    binding.pry

    string.scan(/\b[a-zA-Z]/).join.upcase
  end
end
