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
	values := []float64{a, b, c}
	sort.Float64s(values)

	if incorrectValues(values) {
		return NaT
	}

	uniqueSides := sidesWithTheSameLength(values)

	return triangleKind(uniqueSides)
}

func incorrectValues(values []float64) bool {
	if values[0] == 0 || values[1] == 0 || values[2] == 0 {
		return true
	}

	if len(values) == 3 && values[0]+values[1] < values[2] {
		return true
	}

	if math.IsNaN(values[0]) || math.IsNaN(values[1]) || math.IsNaN(values[2]) {
		return true
	}

	if math.IsInf(values[0], 0) || math.IsInf(values[1], 0) || math.IsInf(values[2], 0) {
		return true
	}

	return false
}

func sidesWithTheSameLength(values []float64) int {
	lengths := map[float64]bool{}

	for _, value := range values {
		lengths[value] = true
	}

	uniqueSides := []float64{}

	for key := range lengths {
		uniqueSides = append(uniqueSides, key)
	}

	return len(uniqueSides)
}

func triangleKind(uniqueSides int) Kind {
	var kind Kind

	switch uniqueSides {
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
