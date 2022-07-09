const COLOR_TO_VALUE: Record<string, number> = {
  "black": 0,
  "brown": 1,
  "red": 2,
  "orange": 3,
  "yellow": 4,
  "green": 5,
  "blue": 6,
  "violet": 7,
  "grey": 8,
  "white": 9,
}

export function decodedValue(colors: Array<string>): number {
  return Number(`${COLOR_TO_VALUE[colors[0]]}${COLOR_TO_VALUE[colors[1]]}`)
}
