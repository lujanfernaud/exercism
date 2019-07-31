package leap

// IsLeapYear reports if a year is a leap year.
func IsLeapYear(year int) bool {
	if year%400 == 0 {
		return true
	}

	if year%4 == 0 && !(year%100 == 0) {
		return true
	}

	return false
}
