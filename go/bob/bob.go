package bob

import (
	"fmt"
	"regexp"
)

// Hey returns Bob's answer.
func Hey(remark string) string {
	fmt.Println("remark:", remark)
	fmt.Println("------")

	yelling := regexp.MustCompile(`[A-Z]!|[A-Z]+$`)
	questioning := regexp.MustCompile(`[^A-Z]\?$`)
	forcefulQuestioning := regexp.MustCompile(`[A-Z]\?$`)

	if yelling.MatchString(remark) {
		return "Whoa, chill out!"
	}

	if questioning.MatchString(remark) {
		return "Sure."
	}

	if forcefulQuestioning.MatchString(remark) {
		return "Calm down, I know what I'm doing!"
	}

	return "Whatever."
}
