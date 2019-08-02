package triangle

import (
	"math"
	"sort"
)

// Kind is used to specify the triangle type.
type Kind string

// Return values.
const (
	NaT = Kind("Not a triangle")
	Equ = Kind("Equilateral")
	Iso = Kind("Isosceles")
	Sca = Kind("Scalene")
)

// KindFromSides returns the type of triangle depending on the sizes of the sides.
func KindFromSides(a, b, c float64) Kind {
	sides := []float64{a, b, c}
	sort.Float64s(sides)

	if incorrectValues(sides) {
		return NaT
	}

	result := sidesWithTheSameLenght(sides)

	var kind Kind

	switch len(result) {
	case 1:
		kind = Equ
	case 2:
		kind = Iso
	case 3:
		kind = Sca
	default:
		kind = NaT
	}

	return kind
}

func incorrectValues(sides []float64) bool {
	if sides[0] == 0 || sides[1] == 0 || sides[2] == 0 {
		return true
	}

	if len(sides) == 3 && sides[0]+sides[1] < sides[2] {
		return true
	}

	if math.IsNaN(sides[0]) || math.IsNaN(sides[1]) || math.IsNaN(sides[2]) {
		return true
	}

	if math.IsInf(sides[0], 0) || math.IsInf(sides[1], 0) || math.IsInf(sides[2], 0) {
		return true
	}

	return false
}

func sidesWithTheSameLenght(sides []float64) []float64 {
	lengths := map[float64]bool{}

	for _, side := range sides {
		lengths[side] = true
	}

	result := []float64{}

	for key := range lengths {
		result = append(result, key)
	}

	return result
}
