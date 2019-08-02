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
	if incorrectValues(a, b, c) {
		return NaT
	}

	if a == b && b == c {
		return Equ
	}

	if a == b || b == c || a == c {
		return Iso
	}

	return Sca
}

func incorrectValues(a, b, c float64) bool {
	values := []float64{a, b, c}
	sort.Float64s(values)

	if values[0]+values[1] < values[2] {
		return true
	}

	for _, value := range values {
		if value == 0 || math.IsNaN(value) || math.IsInf(value, 0) {
			return true
		}
	}

	return false
}
