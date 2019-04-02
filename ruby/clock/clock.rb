class Clock
  MAXIMUM_HOURS = 24

  attr_reader :hour, :minute

  def initialize(args)
    @hour = args[:hour] || 0
    @minute = args[:minute] || 0
  end

  def to_s
    "#{format("%02d", hours)}:#{format("%02d", minutes)}"
  end

  def +(other)
    hour = @hour + other.hours
    minute = @minute + other.minutes

    Clock.new(hour: hour, minute: minute)
  end

  def -(other)
    hour = @hour - other.hours
    minute = @minute - other.minutes

    Clock.new(hour: hour, minute: minute)
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end

  def hours
    hours = @hour % MAXIMUM_HOURS

    if minutes >= 0
      (hours + additional_hours_from_minutes) % MAXIMUM_HOURS
    else
      (hours - additional_hours_from_minutes) % MAXIMUM_HOURS
    end
  end

  def minutes
    minute % 60
  end

  private

  def additional_hours_from_minutes
    minute / 60
  end
end
