class BeerSong
  def verse(number)
    if number > 0
      <<~VERSE
      #{bottles(number)} of beer on the wall, #{bottles(number)} of beer.
      #{take(number)} down and pass it around, #{bottles(number - 1)} of beer on the wall.
      VERSE
    else
      <<~VERSE
      #{bottles(number).capitalize} of beer on the wall, #{bottles(number)} of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    end
  end

  def verses(initial, final)
    initial.downto(final).to_a.map { |number| verse(number) }.join("\n")
  end

  private

  def bottles(number)
    case number
    when 2..99 then "#{number} bottles"
    when 1     then "#{number} bottle"
    when 0     then "no more bottles"
    end
  end

  def take(number)
    case number
    when 2..99 then "Take one"
    when 1     then "Take it"
    end
  end
end

module BookKeeping
  VERSION = 3
end
