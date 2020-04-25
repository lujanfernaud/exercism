require "pry"

class RailFenceCipher
  def self.encode(message, rails_number)
    new(message, rails_number).encode
  end

  def initialize(message, rails_number)
    @message = message
    @characters = message.chars
    @characters_dup = message.chars
    @rails_number = rails_number
    @current_rail = 0
  end

  def encode
    return message if message.empty? || rails_number == 1

    rails = Array.new(rails_number) { Array.new(message.size) }

    char_index = -1
    rail_index = -1

    # characters.size.times do |n|
    #   rails.each_with_index do |rail, rail_index|
    #     char_index += 1
    #     character = characters[char_index]

    #     rail[char_index] = character
    #   end
    # end

    characters.size.times do |n|
      char_index += 1
      direction = get_direction(rails, rail_index)
      puts "direction: #{direction}"
      rail_index = direction == :down ? rail_index + 1 : rail_index - 1
      puts "rails.length: #{rails.length}"
      puts "rail_index: #{rail_index}"

      character = characters[char_index]

      rails[rail_index][char_index] = character
    end

    # rails.map { |rail| rail.join }.join
    rails
  end

  private

  def get_direction(rails, rail_index)
    if rail_index.zero? || rail_index == -1
      :down
    elsif rail_index == rails.size - 1
      :up
    end
  end

  attr_reader :message, :characters, :rails_number, :current_rail
end
