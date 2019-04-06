# frozen_string_literal: true

class Clock
  MAXIMUM_HOURS = 24
  SECONDS = 60

  def initialize(hour: 0, minute: 0)
    @hour = hour % MAXIMUM_HOURS
    @minute = minute
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
      (@hour + additional_hours_from_minutes) % MAXIMUM_HOURS
    else
      (@hour - additional_hours_from_minutes) % MAXIMUM_HOURS
    end
  end

  def minute
    @minute % SECONDS
  end

  private

  def formatted(time)
    format("%02d", time)
  end

  def additional_hours_from_minutes
    @minute / SECONDS
  end
end
