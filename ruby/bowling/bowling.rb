require "pry"

class Game
  def initialize
    @record = []
    @frames = []
    @total  = []
  end

  def roll(pins)
    @record << pins
  end

  def score
    prepare_frames
    score_frames
  end

  private

  attr_reader :record

  def prepare_frames
    @record.each_slice(2) { |slice| @frames << slice }
  end

  # def score_frames
  #   return 0 if record.sum.zero?

  #   @frames.each_with_index do |frame, index|
  #     previous_frame = @frames[index - 1]
  #     # binding.pry if @record.sum == 17 && index == 9

  #     if strike?(frame)

  #     elsif spare_in_last_frame?(previous_frame, index)
  #       @total << frame.sum
  #     elsif spare?(previous_frame)
  #       @total << frame[0] + frame.sum
  #     else
  #       @total << frame.sum
  #     end
  #     # binding.pry if frame == [6, 4]
  #   end

  #   @total.sum
  # end

  # def strike?(frame)
  #   frame[0] == 10
  # end

  # def spare_in_last_frame?(frame, current_index)
  #   spare?(frame) && current_index == 10
  # end

  # def spare?(frame)
  #   frame.sum == 10
  # end

  def score_frames
    return 0 if record.sum.zero?

    @frames.each_with_index do |frame, index|
      # binding.pry if @record.sum == 17 && index == 9

      # if strike?(frame)

      # elsif spare_in_last_frame?(previous_frame, index)
      #   @total << frame.sum
      # elsif spare?(previous_frame)
      #   @total << frame[0] + frame.sum
      # else
      #   @total << frame.sum
      # end
      if frame[0] == 10
        @strike = true
      elsif @strike
        @total << (frame[0] * 2) + (frame[1] * 2)
      elsif @spare && index == 10
        @total << frame.sum
      elsif @spare
        @total << frame[0] + frame.sum
      elsif frame.sum == 10
        @spare = true
        @total << frame.sum
      else
        @total << frame.sum
      end
    end

    @total.sum
  end

  def strike?(frame)
    frame[0] == 10
  end

  def spare_in_last_frame?(frame, current_index)
    spare?(frame) && current_index == 10
  end

  def spare?(frame)
    frame.sum == 10
  end
end
