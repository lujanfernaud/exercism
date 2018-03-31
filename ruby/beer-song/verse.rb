class Verse
  def initialize(number)
    @number = number
  end

  def build
    <<~VERSE
      #{containers_of_beverage.capitalize} on the wall, #{containers_of_beverage}.
      #{action}, #{containers_of_beverage minus_one} on the wall.
    VERSE
  end

  private

  def containers_of_beverage(number = @number)
    "#{quantity(number)} #{containers(number)} of beer"
  end

  def quantity(number)
    if number == 0
      "no more"
    elsif number == -1
      "99"
    else
      number.to_s
    end
  end

  def containers(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def action
    if @number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun
    if @number == 1
      "it"
    else
      "one"
    end
  end

  def minus_one
    @number - 1
  end
end
