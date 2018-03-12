class ETL
  def self.transform(letters)
    letters.each_with_object({}) do |(key, value), hash|
      value.each do |item|
        hash[item.downcase] = key
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
