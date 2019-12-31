# frozen_string_literal: true

class Clock
  attr_reader :time

  SECONDS_PER_MINUTE = 60
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

  def initialize(hour: 0, minute: 0)
    @time = (hour * MINUTES_PER_HOUR) + minute
  end

  def hour
    time / MINUTES_PER_HOUR % HOURS_PER_DAY
  end

  def minute
    time % MINUTES_PER_HOUR
  end

  def to_s
    "#{formatted(hour)}:#{formatted(minute)}"
  end

  def +(other)
    Clock.new(hour: hour + other.hour, minute: minute + other.minute)
  end

  def -(other)
    Clock.new(hour: hour - other.hour, minute: minute - other.minute)
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def formatted(time)
    format("%02d", time)
  end
end
