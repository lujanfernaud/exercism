class SpaceAge
  EARTH_YEAR_IN_SECONDS = 31_557_600.0

  EARTH_YEARS_ON = {
    "earth"   => 1,
    "mercury" => 0.2408467,
    "venus"   => 0.61519726,
    "mars"    => 1.8808158,
    "jupiter" => 11.862615,
    "saturn"  => 29.447498,
    "uranus"  => 84.016846,
    "neptune" => 164.79132
  }

  def initialize(person_age_in_seconds)
    @person_age_in_seconds = person_age_in_seconds
  end

  EARTH_YEARS_ON.keys.each do |planet|
    define_method "on_#{planet}" do
      @person_age_in_seconds / EARTH_YEAR_IN_SECONDS / EARTH_YEARS_ON[planet]
    end
  end
end