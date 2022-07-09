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
  let result: string = ""

  colors.slice(0, 2).forEach((color: string) => { result += COLOR_TO_VALUE[color] })

  return Number(result)
}
