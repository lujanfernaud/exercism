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

export function decodedValue([firstColor, secondColor]: typeof COLORS): number {
  return Number(`${COLORS.indexOf(firstColor)}${COLORS.indexOf(secondColor)}`)
}
