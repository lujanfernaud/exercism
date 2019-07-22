// Package twofer provides solution for "two for one" Exercism's problem.
package twofer

import (
	"fmt"
)

// ShareWith returns sentence with given name, or with "you" is no name is
// provided.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}

	return fmt.Sprintf("One for %s, one for me.", name)
}
