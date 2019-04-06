# frozen_string_literal: true

class Clock
  attr_reader :maximum_hours

  def initialize(hour: 0, minute: 0, maximum_hours: 24)
    @hour = hour % maximum_hours
    @minute = minute
    @maximum_hours = maximum_hours
  end

  def to_s
    "#{formatted(hour)}:#{formatted(minute)}"
  end

  def +(other)
    total_hours = hour + other.hour
    total_minutes = minute + other.minute

    Clock.new(hour: total_hours, minute: total_minutes)
  end

  def -(other)
    total_hours = hour - other.hour
    total_minutes = minute - other.minute

    Clock.new(hour: total_hours, minute: total_minutes)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def hour
    if minute >= 0
      (@hour + additional_hours_from_minutes) % maximum_hours
    else
      (@hour - additional_hours_from_minutes) % maximum_hours
    end
  end

  def minute
    @minute % SECONDS_IN_A_MINUTE
  end

  private

  SECONDS_IN_A_MINUTE = 60

  def formatted(time)
    format("%02d", time)
  end

  def additional_hours_from_minutes
    @minute / SECONDS_IN_A_MINUTE
  end
end
