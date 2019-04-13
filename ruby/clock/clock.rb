# frozen_string_literal: true

class Clock
  attr_reader :time_in_minutes, :time

  MINUTES_IN_AN_HOUR = 60
  SECONDS_IN_A_MINUTE = 60

  def initialize(hour: 0, minute: 0)
    @time_in_minutes = (hour * MINUTES_IN_AN_HOUR) + minute
    @time = Time.at(@time_in_minutes * SECONDS_IN_A_MINUTE)
  end

  def hour
    time.strftime("%H").to_i
  end

  def minute
    time.strftime("%M").to_i
  end

  def to_s
    time.strftime("%H:%M")
  end

  def +(other)
    recalculated_new_clock(other, :+)
  end

  def -(other)
    recalculated_new_clock(other, :-)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  private

  def recalculated_new_clock(other_clock, operation)
    total_hours = hour.send(operation.to_sym, other_clock.hour)
    total_minutes = minute.send(operation.to_sym, other_clock.minute)

    Clock.new(hour: total_hours, minute: total_minutes)
  end
end
