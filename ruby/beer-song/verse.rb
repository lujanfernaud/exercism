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
      #{quantity} #{containers} of beer on the wall, #{quantity} #{containers} of beer.
      Take #{pronoun} down and pass it around, #{quantity minus_one} #{containers minus_one} of beer on the wall.
    VERSE
  end

  def verse_without_bottles
    <<~VERSE
      #{quantity.capitalize} #{containers} of beer on the wall, #{quantity} #{containers} of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
  end

  def quantity(number = @number)
    number == 0 ? "no more" : number
  end

  def containers(number = @number)
    number == 1 ? "bottle" : "bottles"
  end

  def pronoun
    case @number
    when 2..99 then "one"
    when 1     then "it"
    end
  end

  def minus_one
    @number - 1
  end
end
