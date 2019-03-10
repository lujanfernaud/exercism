class Isogram
  def self.isogram?(string)
    string.downcase!

    return true if string.empty?

    string.gsub(/\W/, "").chars.uniq.join == string.gsub(/\W/, "")
  end
end