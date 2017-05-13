class Robot
  def self.used_names
    @used_names ||= []
  end

  attr_reader :name

  def initialize
    generate_name
  end

  def reset
    generate_name
  end

  private

  def generate_name
    loop do
      @name = Array.new(2) { [*"A".."Z"].sample }.join + rand(100..999).to_s
      break unless Robot.used_names.include?(@name)
    end
    Robot.used_names << @name
  end
end

module BookKeeping
  VERSION = 2
end
