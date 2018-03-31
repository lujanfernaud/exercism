require "./verse"
require "./book_keeping"

class BeerSong
  def verse(number)
    Verse.new(number).build
  end

  def verses(initial, final)
    initial.downto(final).to_a.map { |number| verse(number) }.join("\n")
  end
end
