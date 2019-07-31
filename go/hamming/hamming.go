package hamming

import "errors"

// Distance returns the number of different items between two DNA strands.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("Strands lenght is different")
	}

	if a == "" || b == "" {
		return 0, nil
	}

	result := 0

	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			result++
		}
	}

	return result, nil
}
