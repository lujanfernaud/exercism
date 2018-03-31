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
      #{bottles} of beer on the wall, #{bottles} of beer.
      #{take_some} down and pass it around, #{bottles &minus_one} of beer on the wall.
    VERSE
  end

  def verse_without_bottles
    <<~VERSE
      #{bottles.capitalize} of beer on the wall, #{bottles} of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
  end

  def bottles
    @number = yield(@number) if block_given?

    case @number
    when 2..99 then "#{@number} bottles"
    when 1     then "1 bottle"
    when 0     then "no more bottles"
    end
  end

  def minus_one
    proc { |number| number - 1 }
  end

  def take_some
    case @number
    when 2..99 then "Take one"
    when 1     then "Take it"
    end
  end
end
