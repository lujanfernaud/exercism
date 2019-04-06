# frozen_string_literal: true

class Clock
  attr_reader :maximum_hours

  def initialize(hour: 0, minute: 0, maximum_hours: 24)
    @hour = hour % maximum_hours
    @minute = minute
    @maximum_hours = maximum_hours
  end

  def hour
    minute >= 0 ? recalculated_hour(:+) : recalculated_hour(:-)
  end

  def minute
    @minute % SECONDS_IN_A_MINUTE
  end

  def to_s
    "#{formatted(hour)}:#{formatted(minute)}"
  end

  def +(other)
    raise IncompatibleError, IncompatibleError.message unless compatible?(other)

    recalculated_new_clock(other, :+)
  end

  def -(other)
    raise IncompatibleError, IncompatibleError.message unless compatible?(other)

    recalculated_new_clock(other, :-)
  end

  def ==(other)
    hour == other.hour && minute == other.minute && compatible?(other)
  end

  private

  SECONDS_IN_A_MINUTE = 60

  def recalculated_hour(operator)
    @hour.send(operator.to_sym, additional_hours_from_minutes) % maximum_hours
  end

  def additional_hours_from_minutes
    @minute / SECONDS_IN_A_MINUTE
  end

  def formatted(time)
    format("%02d", time)
  end

  def recalculated_new_clock(other_clock, operation)
    total_hours = hour.send(operation.to_sym, other_clock.hour)
    total_minutes = minute.send(operation.to_sym, other_clock.minute)

    Clock.new(hour: total_hours, minute: total_minutes)
  end

  def compatible?(other)
    maximum_hours == other.maximum_hours
  end

  class IncompatibleError < StandardError
    def self.message
      "Clocks need to have the same maximum hours."
    end
  end
end
