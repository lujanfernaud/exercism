const COLORS = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white"
]

export function decodedValue([color1, color2]: typeof COLORS): number {
  return Number(`${COLORS.indexOf(color1)}${COLORS.indexOf(color2)}`)
}
