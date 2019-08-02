package triangle

import (
	"math"
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
	if notATriangle(a, b, c) {
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

func notATriangle(a, b, c float64) bool {
	if a+b < c || a+c < b || b+c < a {
		return true
	}

	lengths := []float64{a, b, c}

	for _, length := range lengths {
		if length == 0 || math.IsNaN(length) || math.IsInf(length, 0) {
			return true
		}
	}

	return false
}
