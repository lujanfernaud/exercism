class SpaceAge
  EARTH_YEAR_IN_SECONDS = 31_557_600.0

  EARTH_YEARS_ON = {
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

  def on_earth
    earth_years
  end

  private

  def earth_years
    @earth_years ||= person_age_in_seconds / EARTH_YEAR_IN_SECONDS
  end

  def on_(planet)
    earth_years / EARTH_YEARS_ON[planet]
  end

  def respond_to_missing?(method_name)
    method_name =~ /on_\w+/
  end

  def method_missing(method_name)
    planet = method_name.to_s.sub(/on_/, "")

    on_(planet) || super
  end

  attr_reader :person_age_in_seconds
end