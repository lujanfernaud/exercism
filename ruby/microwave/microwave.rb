class Microwave
  MINUTE_IN_SECONDS = 60.freeze

  # @param time [Integer]
  def initialize(time)
    @time_values = (time / 100.0).to_s.split('.')
    @minutes = @time_values.first.rjust(2, '0')
    @seconds = @time_values.last.ljust(2, '0')
  end

  # @return [String]
  def timer
    return "#{minutes}:#{seconds}" if seconds < '60'

    calculate_time
  end

  private

  attr_reader :minutes, :seconds

  # @return [String]
  def calculate_time
    extra_minutes = seconds.to_i / MINUTE_IN_SECONDS
    calculated_seconds = seconds.to_i % MINUTE_IN_SECONDS

    calculated_minutes = (minutes.to_i + extra_minutes).to_s.rjust(2, '0')
    calculated_seconds = calculated_seconds.to_s.rjust(2, '0')

    "#{calculated_minutes}:#{calculated_seconds}"
  end
end
