class Isogram
  def self.isogram?(string)
    string.downcase!

    return true if string.empty?

    string.scan(/\w/).uniq == string.scan(/\w/)
  end
end
