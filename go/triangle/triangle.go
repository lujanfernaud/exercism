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

	uniqueSides := calculateUniqueSides(values)

	return triangleKind(uniqueSides)
}

func incorrectValues(values []float64) bool {
	if len(values) == 3 && values[0]+values[1] < values[2] {
		return true
	}

	for _, value := range values {
		if value == 0 || math.IsNaN(value) || math.IsInf(value, 0) {
			return true
		}
	}

	return false
}

func calculateUniqueSides(values []float64) int {
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
