# frozen_string_literal: true

# Write your code for the 'Scale Generator' exercise in this file. Make the tests in
# `scale_generator_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/scale-generator` directory.

class Scale
  attr_reader :note, :type

  TONIC = {
    sharps: %w[C C# D D# E F F# G G# A A# B],
    flats: %w[C Db D Eb E F Gb G Ab A Bb B]
  }.freeze

  PAIRS = {
    "F" => { major: :flats },
    "Bb" => { major: :flats },
    "Eb" => { major: :flats },
    "Ab" => { major: :flats },
    "Db" => { major: :flats },
    "Gb" => { major: :flats },
    "G" => { major: :sharps },
    "D" => { major: :sharps },
    "A" => { major: :sharps },
    "E" => { major: :sharps },
    "B" => { major: :sharps },
    "F#" => { major: :sharps },
    "e" => { minor: :sharps },
    "b" => { minor: :sharps },
    "f#" => { minor: :sharps },
    "c#" => { minor: :sharps },
    "g#" => { minor: :sharps },
    "d#" => { minor: :sharps },
    "d" => { minor: :flats },
    "g" => { minor: :flats },
    "c" => { minor: :flats },
    "f" => { minor: :flats },
    "bb" => { minor: :flats },
    "eb" => { minor: :flats }
  }.freeze

  SCALES = {
    chromatic: %w[A Bb B C Db D Eb E F Gb G Ab]
  }.freeze

  def initialize(note, type)
    @note = note.to_s.upcase
    @type = type.to_sym
  end

  def name
    "#{note} #{type}"
  end

  def pitches
    SCALES[type]
  end
end
