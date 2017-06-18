class RunLengthEncoding
  def self.encode(data)
    Encoder.new(data).encode
  end

  def self.decode(data)
    Decoder.new(data).decode
  end
end

class Encoder
  attr_reader :data, :instances

  def initialize(data)
    @data      = data
    @instances = []
  end

  def encode
    separate_instances
    compress_instances
  end

  private

  def separate_instances
    until data.empty?
      character_group = data.match(/((\s|\w)\2*)/)[0]
      instances << data.slice!(character_group)
    end
  end

  def compress_instances
    instances.map do |characters|
      instances = characters.length

      if instances == 1
        characters
      else
        [instances, characters[0]]
      end
    end.join
  end
end

class Decoder
  attr_reader :data, :instances

  def initialize(data)
    @data      = data.split("")
    @instances = []
  end

  def decode
    separate_instances
    expand_instances
  end

  private

  def separate_instances
    until data.empty?
      letter_index = (data.join =~ /\D/) + 1
      instances << data.shift(letter_index)
    end
  end

  def expand_instances
    result = []

    instances.each do |characters|
      characters = characters.join

      if characters.length == 1
        result << characters
        next
      end

      letter_index = characters =~ /\D/
      instances    = characters.match(/\d+/)[0].to_i

      instances.times { result << characters[letter_index] }
    end

    result.join
  end
end

module BookKeeping
  VERSION = 3
end
