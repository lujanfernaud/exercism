require "./bottle_number"

class Verse
  def initialize(number)
    @number = number
  end

  def build
    <<~VERSE
      #{containers_of_beverage.capitalize} on the wall, #{containers_of_beverage}.
      #{action}, #{containers_of_beverage successor} on the wall.
    VERSE
  end

  private

  def containers_of_beverage(number = @number)
    "#{quantity(number)} #{containers(number)} of beer"
  end

  def quantity(number)
    BottleNumber.new(number).quantity
  end

  def containers(number)
    BottleNumber.new(number).containers
  end

  def action
    BottleNumber.new(@number).action
  end

  def successor
    if @number == 0
      99
    else
      @number - 1
    end
  end
end
