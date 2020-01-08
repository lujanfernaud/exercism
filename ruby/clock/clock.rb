# frozen_string_literal: true

class Clock
  attr_reader :time

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

  def initialize(hour: 0, minute: 0)
    @time = ((hour * MINUTES_PER_HOUR) + minute) % MINUTES_PER_DAY
  end

  def to_s
    "#{formatted_hour}:#{formatted_minute}"
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

  def formatted_hour
    format("%<hour>02d", hour: time / MINUTES_PER_HOUR)
  end

  def formatted_minute
    format("%<minute>02d", minute: time % MINUTES_PER_HOUR)
  end
end
