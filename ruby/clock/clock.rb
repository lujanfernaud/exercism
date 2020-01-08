# frozen_string_literal: true

class Clock
  attr_reader :time_in_minutes

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
  TIME_FORMAT = "%02d:%02d"

  def initialize(hour: 0, minute: 0)
    @time_in_minutes = ((hour * MINUTES_PER_HOUR) + minute) % MINUTES_PER_DAY
  end

  def to_s(time_format = TIME_FORMAT)
    format(time_format, hour, minute)
  end

  def +(other)
    self.class.new(minute: time_in_minutes + other.time_in_minutes)
  end

  def -(other)
    self.class.new(minute: time_in_minutes - other.time_in_minutes)
  end

  def ==(other)
    time_in_minutes == other.time_in_minutes
  end

  private

  def hour
    time_in_minutes / MINUTES_PER_HOUR
  end

  def minute
    time_in_minutes % MINUTES_PER_HOUR
  end
end
