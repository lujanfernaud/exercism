class Verse
  def initialize(number)
    @number = number
  end

  def build
    @number > 0 ? verse_with_bottles : verse_without_bottles
  end

  private

  def verse_with_bottles
    <<~VERSE
      #{number} #{containers} of beer on the wall, #{number} #{containers} of beer.
      Take #{pronoun} down and pass it around, #{number &minus_one} #{containers} of beer on the wall.
    VERSE
  end

  def verse_without_bottles
    <<~VERSE
      #{number.capitalize} #{containers} of beer on the wall, #{number} #{containers} of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
  end

  def number
    @number = yield(@number) if block_given?

    @number == 0 ? "no more" : @number
  end

  def minus_one
    proc { |number| number - 1 }
  end

  def containers
    @number == 1 ? "bottle" : "bottles"
  end

  def pronoun
    case @number
    when 2..99 then "one"
    when 1     then "it"
    end
  end
end
