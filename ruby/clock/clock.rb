# frozen_string_literal: true

class Clock
  attr_reader :time

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
  TIME_FORMAT = "%02d:%02d"

  def initialize(hour: 0, minute: 0)
    @time = ((hour * MINUTES_PER_HOUR) + minute) % MINUTES_PER_DAY
  end

  def to_s(time_format = TIME_FORMAT)
    format(time_format, hour, minute)
  end

  def +(other)
    self.class.new(minute: time + other.time)
  end

  def -(other)
    self.class.new(minute: time - other.time)
  end

  def ==(other)
    time == other.time
  end

  private

  def hour
    time / MINUTES_PER_HOUR
  end

  def minute
    time % MINUTES_PER_HOUR
  end
end
