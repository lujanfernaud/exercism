class Isogram
  def self.isogram?(string)
    return true if string.empty?

    characters = string.downcase.scan(/\w/)

    characters.uniq == characters
  end
end
