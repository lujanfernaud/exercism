class ETL
  def self.transform(letters)
    {}.tap do |hash|
      letters.each do |key, value|
        value.each do |v|
          hash[v.downcase] = key
        end
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
