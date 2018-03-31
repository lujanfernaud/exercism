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
      #{containers_of_beverage} on the wall, #{containers_of_beverage}.
      #{action}, #{containers_of_beverage minus_one} on the wall.
    VERSE
  end

  def verse_without_bottles
    <<~VERSE
      #{containers_of_beverage.capitalize} on the wall, #{containers_of_beverage}.
      #{action}, #{containers_of_beverage(99)} on the wall.
    VERSE
  end

  def containers_of_beverage(number = @number)
    "#{quantity(number)} #{containers(number)} of beer"
  end

  def quantity(number)
    number == 0 ? "no more" : number.to_s
  end

  def containers(number)
    number == 1 ? "bottle" : "bottles"
  end

  def minus_one
    @number - 1
  end

  def action(number = @number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun(number = @number)
    number == 1 ? "it" : "one"
  end
end
