package twofer

import (
	"fmt"
)

func ShareWith(name string) string {
	var name_placeholder string

	if len(name) == 0 {
		name_placeholder = "you"
	} else {
		name_placeholder = name
	}

	return fmt.Sprintf("One for %s, one for me.", name_placeholder)
}
